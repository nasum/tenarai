require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#create' do
    context 'when all column fill' do
      it 'create record' do
        expect{ create(:article) }.to change{ Admin::Article.count }.by(1)
      end
    end

    context 'when not fill content column' do
      it 'don`t create record' do
        expect( build(:article, content: '') ).to_not be_valid
      end
    end

    context 'when fill blank to content column' do
      it 'don`t create record' do
        expect( build(:article, content: '    ') ).to_not be_valid
      end
    end
  end

  describe '#edit' do
    let(:article) { create(:article) }

    context 'when all column fill' do
      let(:edit_content) { Faker::Lorem.sentence }
      let(:edit_article) { article.update(content: edit_content) }

      it 'save record' do
        expect( edit_article ).to be_truthy
      end
    end

    context 'when not fill content column' do
      let(:edit_article) { article.update(content: '') }

      it 'raise validation error' do
        expect( edit_article ).to be_falsey
      end
    end

    context 'when fill blank to content column' do
      let(:edit_article) { article.update(content: ' ') }

      it 'raise validation error' do
        expect( edit_article ).to be_falsey
      end
    end
  end

  describe '#delete' do
    context '' do

    end
  end
end
