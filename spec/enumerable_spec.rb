#!/usr/bin/env ruby
# encoding: UTF-8

RSpec.describe "Enumerables" do

  describe "Methods in enumerable module that gets mixed in to the `Array` and `Hash` classes" do
    arr = [4,3,78,2,0,2]
    context "my_each" do
      it "should loop through all the item in the array" do
        i = 0
        arr.my_each do |item|
          i += 1
        end
        expect(arr.length).to eq i
      end
    end

    context "my_each_with_index" do
      it "should loop through all item in the array with the index" do
        arr.my_each_with_index do |item, index|
          expect(arr[index]).to eq item
        end
      end
    end

    context "my_select" do
      it "should select only item that meet the creteria in block" do
        newArr = arr.my_select { |item| item > 3 }
        expect(newArr).to eq [4, 78]
      end
    end

    context "my_all" do
      it "return false if all the items in the array did not meet the condition in the block" do
        all = arr.my_all? { |item| item > 3 }
        expect(all).to be_falsey
      end

      it "return true if all the items in the array meet the condition in the block" do
        all = arr.my_all? { |item| item >= 0 }
        expect(all).to be_truthy
      end
    end

    context "my_none" do
      it "return true if none the items in the array meet the condition in the block" do
        all = arr.my_none? { |item| item > 100 }
        expect(all).to be_truthy
      end

      it "return true if all the items in the array meet the condition in the block" do
        all = arr.my_none? { |item| item < 0 }
        expect(all).to be_truthy
      end
    end

    context "my_count" do
      it "return number of item in the array" do
        expect(arr.my_count).to eq 6
      end

      it "return number of item in an array that equals a particular number" do
        expect(arr.my_count(2)).to eq 2
        expect(arr.my_count(3)).to eq 1
      end

      it "return number of item in an array that meets the creteria in the block" do
        num = arr.my_count {|item| item > 0 }
        expect(num).to eq 5
      end
    end

    context "my_map" do
      it "return a modified array using the content of the given block" do
        newArr = arr.my_map { |item| item.to_s + '!' }
        expect(newArr).to eq ['4!', '3!', '78!', '2!', '0!', '2!']
      end
    end

    context "my_inject" do
      it "return a running_total based on the content of the given block" do
        def multiply_els (arrayParam)
         return arrayParam.my_inject(1) {|total, item| total * item}
        end
        expect(multiply_els [4,3,78,2,1,2]).to eq 3744
      end
    end

    context "my_map_with_proc" do
      it "return a modified array using the content of the given proc" do
        procedure = Proc.new {|item| item + 1}
        expect(arr.my_map_with_proc(&procedure)).to eq [5,4,79,3,1,3]
      end
    end

    context "my_map_with_proc_block" do
      it "return a modified array using the content of the given proc and || block" do
        procedure = Proc.new {|item| item + 1}
        expect(arr.my_map_with_proc_block(procedure)).to eq [5,4,79,3,1,3]
        result = arr.my_map_with_proc_block(procedure) {|item| item * 2 }
        expect(result).to eq [10,8,158,6,2,6]
      end
    end
  end
end