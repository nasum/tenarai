require 'rails_helper'

RSpec.describe Admin::Article, type: :model do
  describe '#create' do
    context 'when all column fill' do
      let(:article) { create(:article) }

      it 'don`t create record' do
        expect{ :article }.to change{ Admin::Article.count }.by(1)
      end
    end

    context 'when not fill content column' do
      let(:article) { create(:article, content: '') }

      it 'don`t create record' do
        expect{ :article }.to change{ Admin::Article.count }.by(0)
      end
    end

    context 'when fill blank to content column' do
      let(:article) { create(:article, content: '    ') }

      it 'don`t create record' do
        expect{ :article }.to change{ Admin::Article.count }.by(0)
      end
    end
  end

  describe '#edit' do
    let(:article) { create(:article) }

    context 'when all column fill' do
      let(:edit_content) { Faker::Lorem.sentence }
      let(:edit_article) { article.update(content: edit_context) }

      it 'save record' do
        expect{ edit_article.context }.to eq edit_content
      end

      it 'valid' do
        expect{ edit_article }.to be_valid
      end
    end

    context 'when not fill content column' do
      let(:edit_article) { article.content = '' }

      it 'raise validation error' do
        expect{ :edit_article }.not_to be_valid
      end
    end

    context 'when fill blank to content column' do
      let(:edit_article) { article.content = '   ' }

      it 'raise validation error' do
        expect{ :edit_article }.not_to be_valid
      end
    end
  end

  describe '#delete' do
    context '' do

    end
  end
end
