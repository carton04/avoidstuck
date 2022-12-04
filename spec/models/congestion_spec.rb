require 'rails_helper'

RSpec.describe Congestion, type: :model do
  before do
    @congestion = FactoryBot.build(:congestion)
  end

  describe '投稿保存' do
    context 'スタック情報を投稿できる場合とき' do
      it 'すべてのフォームの入力がされている' do
        expect(@congestion).to be_valid
      end
      it '状況が空でも投稿できる' do
        @congestion.situation = ''
        expect(@congestion).to be_valid
      end
      it '画像が空でも投稿できる' do
        @congestion.image = nil
        expect(@congestion).to be_valid
      end
    end

    context 'スタック情報を投稿できない場合とき' do
      it 'ski_resort_idが空では登録できないこと' do
        @congestion.ski_resort_id = nil
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Ski resort can't be blank")
      end
      it 'waitingが空では登録できないこと' do
        @congestion.waiting = ''
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting can't be blank")
      end
      it 'waitingが1未満では登録できないこと' do
        @congestion.waiting = 0
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting must be greater than or equal to 1")
      end
      it 'waitingが1000以上では登録できないこと' do
        @congestion.waiting = 1000
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting must be less than or equal to 999")
      end
      it 'waitingが全角文字では登録できないこと' do
        @congestion.waiting = '３００'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting is not a number")
      end
      it 'waitingが半角英数混合では登録できないこと' do
        @congestion.waiting = 'a300'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting is not a number")
      end
      it 'waitingが半角英語だけでは登録できないこと' do
        @congestion.waiting = 'a'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Waiting is not a number")
      end
      it 'latitudeが空では登録できないこと' do
        @congestion.latitude = ''
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Latitude can't be blank")
      end
      it 'latitudeが全角文字では登録できないこと' do
        @congestion.latitude = '３００'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Latitude is not a number")
      end
      it 'latitudeが半角英数混合では登録できないこと' do
        @congestion.latitude = 'a300'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Latitude is not a number")
      end
      it 'latitudeが半角英語だけでは登録できないこと' do
        @congestion.latitude = 'a'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Latitude is not a number")
      end
      it 'longitudeが空では登録できないこと' do
        @congestion.longitude = ''
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Longitude can't be blank")
      end
      it 'longitudeが全角文字では登録できないこと' do
        @congestion.longitude = '３００'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Longitude is not a number")
      end
      it 'longitudeが半角英数混合では登録できないこと' do
        @congestion.longitude = 'a300'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Longitude is not a number")
      end
      it 'longitudeが半角英語だけでは登録できないこと' do
        @congestion.longitude = 'a'
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("Longitude is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @congestion.user = nil
        @congestion.valid?
        expect(@congestion.errors.full_messages).to include("User must exist")
      end
    end
  end
end