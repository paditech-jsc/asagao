class MembersController < ApplicationController
  def index
    order = 'member_number'
    order = 'furigana' if params[:sort] == 'byname'
    @members  = Member.find(:all, :order  =>  order)
  end
  # ひとつのレコードを表示
  def show
    @member = Member.find(params[:id])
  end
  #新規作成用フォーム
  def new
    @member = Member.new
  end
  #返信用フォ無
  def edit
    @member = Member.find(params[:id])
  end
  #レーコとの新規作成（フォームから呼ばれる）
  def create
    @member = Member.new(params[:member])
    @member.save
  end
  #レコードの削除
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
  end
  #レコード変更
  def update
    @member = Member.find(params[:id])
    @member.attributes  = params[:member]
    @member.save
  end
  def search
    @query  = params[:q]
    unless @query
      redirect_to  :action  =>  'index'
      return
    end
    condition = ['family_name like  ? or  given_name  like  ?'  +
      'or furigana  like  ? or  member_number = ?',
      "%#{@query}%",  "%#{@query}%",  "%#{@query}%",  @query]
    @member = Member.find(:all, :condition  =>  condition,  :order  =>  'member_number')
    render  :action =>  'index'
  end

  def show
  end

end

