require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント保存' do
    context 'コメントできる場合のとき' do
      it 'contentの入力がされている' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできない場合のとき' do
      it 'contentが空では登録できないこと' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'congestionが紐付いていなければ投稿できない' do
        @comment.congestion = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Congestion must exist')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end
  end
end
