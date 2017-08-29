require 'rails_helper'

describe Que do
  # 名前とメール、内容があれば有効な状態であること
  it "is valid with name" do
    q = Que.new(name: '宮岡', email: 'ac@gmail.com', content: '暑いです')
    expect(q).to be_valid
  end

  #タイトルがなければ無効であること
  it "is invalid without a content" do
    q = Que.new(name: '宮岡',email: 'ac@gmail.com')
    expect(q).not_to be_valid
  end

  it "is invalid without a name" do
    q = Que.new(content: '暑いです',email: 'ac@gmail.com')
    expect(q).not_to be_valid
  end

  it "is invalid without a email" do
    q = Que.new(content: '暑いです',name: '宮岡')
    expect(q).not_to be_valid
  end

  it "is invalid without a email and content" do
    q = Que.new(name: '宮岡')
    expect(q).not_to be_valid
  end

  it "is invalid without a email and name" do
    q = Que.new(content: '暑いです')
    expect(q).not_to be_valid
  end

  it "is invalid without a name and content" do
    q = Que.new(email: 'ac@gmail.com')
    expect(q).not_to be_valid
  end


  #タイトルがなければ無効であること
  it "is valid with name" do
    blog = Blog.new
    blog.valid?
    expect(blog.errors[:title]).to include("を入力してください")
  end
end