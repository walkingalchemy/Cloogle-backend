require 'byebug'

class Node
  attr_reader :value, :children, :parent

  def initialize(value, parent)
    @value = value
    @children = []
    @parent = parent
  end

  def trie
    current_node = self
    while current_node.parent.class != PuzzleTrie
      current_node = current_node.parent
    end
    current_node.parent
  end

  def insert(char) # returns child node
    if self.have?(char)
      get_child(char)
    else
      child = Node.new(char, self)
      self.children << child
      child
    end
  end

  def have?(char) # returns true if child exists, else false
    @children.any? do |child|
      child.value == char
    end
  end

  def get_child(char) #returns child or nil
    @children.select do |child|
      child.value == char
    end.first
  end

  def get_all_parents
    result = []
    unless self.parent.class == PuzzleTrie
      result.unshift(self.parent)
      result.unshift(self.parent.get_all_parents)
    end
    result.flatten
  end




  def get_all_word_endings_as_nodes
    if self.children.length <= 1
      result = self.children.map do |child|
        [child, child.get_all_word_endings_as_nodes].flatten
      end
    else self.children.length > 1
      result = []
      self.children.each do |child|
        result << [child, child.get_all_word_endings_as_nodes].flatten
      end
    end
    result
  end

  def get_all_word_endings_as_strings
      result = self.children.map do |child|
        if child.children.length <=1
          [child.value, child.get_all_word_endings_as_strings].flatten.join("")
        else
          sub_result = []
          child.children.each do |grandchild|
            sub_result << [child.value, grandchild.value, grandchild.get_all_word_endings_as_strings].flatten
          end
          sub_result
        end
      end
    result
  end

  def get_all_word_endings_as_strings
    if self.children.length <= 1
        result = self.children.map do |child|
          [child.value, child.get_all_word_endings_as_strings].flatten.join("")
        end
    else
      result = self.children.map do |child|
        sub_result = []
        child.children.each do |grandchild|
          sub_result << [child.value, grandchild.value, grandchild.get_all_word_endings_as_strings].flatten
        end
        sub_result.map(&:join)
      end
    end
    result
  end


  def map_words(prefix, array_of_endings)
    array_of_endings.map do |el|
      if el.class == [].class
        self.map_words(prefix, el)
      else
        prefix + el
      end
    end
  end

  def possible_words # returns array of possible words from node
    # find prefix (top of trie is nil), which is constant and includes value of current node
      # find all n*parent nodes as array in order, then .join("")

    prefix = self.get_all_parents.map(&:value).join("") + "#{self.value}"

    endings = self.get_all_word_endings_as_strings

    self.map_words(prefix, endings).flatten

  end


end

class PuzzleTrie
  attr_reader :root
  def initialize
    @root = Node.new(nil, self)
  end

  def insert(word)
    node = @root
    word.split("").each do |letter|
      node = node.insert(letter)
    end
    node
  end

  def have?(word)
    node = @root
    word.split("").each do |letter|
      if node.have?(letter)
        node = node.get_child(letter)
      else
        return false
      end
    end

    return true
  end

  def to_array
  end

  def trie_of_applicable_words()
  end

  def array_of_applicable_words()
  end

end

trie = PuzzleTrie.new

trie.insert("panther")
trie.insert("panhandle")
trie.insert("pansexual")
trie.insert("path")
trie.insert("pathfinder")
trie.insert("parents")
trie.insert("parrot")

node = trie.root.children.first.children.first

possibilities = node.possible_words

trie.root.children.first.possible_words

byebug

"test"
