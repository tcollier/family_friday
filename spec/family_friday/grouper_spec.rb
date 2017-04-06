require_relative '../../lib/family_friday/grouper'

module FamilyFriday
  RSpec.describe Grouper do
    subject { Grouper.new(items: items) }

    shared_examples_for 'a grouper' do |group_counts|
      it "returns #{group_counts.length} groups with #{group_counts.join(', ')} items each" do
        groups = subject.groups
        expect(groups.length).to eq(group_counts.length)
        group_counts.each.with_index do |group_count, index|
          expect(groups[index].length).to eq(group_count)
        end
        expect(groups.flatten).to match_array(items)
      end
    end

    it_behaves_like 'a grouper', [0] do
      let(:items) { [] }
    end

    it_behaves_like 'a grouper', [1] do
      let(:items) { [:a] }
    end

    it_behaves_like 'a grouper', [2] do
      let(:items) { %i[a b] }
    end

    it_behaves_like 'a grouper', [3] do
      let(:items) { %i[a b c] }
    end

    it_behaves_like 'a grouper', [4] do
      let(:items) { %i[a b c d] }
    end

    it_behaves_like 'a grouper', [5] do
      let(:items) { %i[a b c d e] }
    end

    it_behaves_like 'a grouper', [3, 3] do
      let(:items) { %i[a b c d e f] }
    end

    it_behaves_like 'a grouper', [4, 3] do
      let(:items) { %i[a b c d e f g] }
    end

    it_behaves_like 'a grouper', [4, 4] do
      let(:items) { %i[a b c d e f g h] }
    end

    it_behaves_like 'a grouper', [4, 5] do
      let(:items) { %i[a b c d e f g h i] }
    end

    it_behaves_like 'a grouper', [4, 3, 3] do
      let(:items) { %i[a b c d e f g h i h] }
    end

    context 'shuffling' do
      let(:items) { %i[a b c d e f] }

      it 'shuffles the items' do
        expect(subject.groups(seed: 1234)).to eq([%i[c b f], %i[a e d]])
      end
    end
  end
end
