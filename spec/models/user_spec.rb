require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nameとemail、passwordとpassword_confirmation、birth_day、family_name、first_name、family_name_reading、first_name_readingが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'birth_dayが空では登録できない' do
        user = FactoryBot.build(:user)
        user.birth_day = nil
        expect(user).not_to be_valid
        expect(user.errors[:birth_day]).to include("can't be blank")
      end

      it 'family_nameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.family_name = ''
        expect(user).not_to be_valid
        expect(user.errors[:family_name]).to include("can't be blank")
      end

      it 'first_nameが空では登録できない' do
        user = FactoryBot.build(:user)
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'family_name_readingが空では登録できない' do
        user = FactoryBot.build(:user)
        @user.family_name_reading = ''
        @user.valid?
        expect(@user.errors[:family_name_reading]).to include("can't be blank")
      end

      it 'first_name_readingが空では登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_reading = ''
        expect(user).not_to be_valid
        expect(user.errors[:first_name_reading]).to include("can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid. Include both letters and numbers')
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid. Include both letters and numbers')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password  is invalid. Include both letters and numbers')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'family_nameが全角でないと登録できない' do
        @user.family_name = 'yamada'
        @user.valid?
        expect(@user.errors[:family_name]).to include(' is invalid. Input full-width characters')
      end

      it 'first_nameが全角でないと登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors[:first_name]).to include(' is invalid. Input full-width characters')
      end

      it 'family_name_readingが全角カタカナでないと登録できない' do
        user = FactoryBot.build(:user)
        user.family_name_reading = 'やまだ'
        user.valid?
        expect(user.errors[:family_name_reading]).to include(' is invalid. Input full-width katakana characters')
      end

      it 'first_name_readingが全角カタカナでないと登録できない' do
        user = FactoryBot.build(:user)
        user.first_name_reading = 'たろう'
        user.valid?
        expect(user.errors[:first_name_reading]).to include(' is invalid. Input full-width katakana characters')
      end
    end
  end
end
