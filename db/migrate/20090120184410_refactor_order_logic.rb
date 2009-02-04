class RefactorOrderLogic < ActiveRecord::Migration
  def self.up
    # TODO: Combine migrations since foodsoft3-development into one file
    # and try to build a migration path from old data.
    
#    # == Ordergroups
#    add_column :groups, :deleted_at, :datetime # acts_as_paranoid
#    remove_column :groups, :actual_size        # Useless, desposits are better stored within a transaction.note
#    # move contact-infos from users to ordergroups
#    add_column :groups, :contact_person, :string
#    add_column :groups, :contact_phone, :string
#    add_column :groups, :contact_address, :string
#    Ordergroup.all.each do |ordergroup|
#      contact = ordergroup.users.first
#      if contact
#        ordergroup.update_attributes :contact_person => contact.name,
#          :contact_phone => contact.phone, :contact_address => contact.address
#      end
#    end
#    remove_column :users, :address
#
#    # == Article
#    rename_column :articles, :net_price, :price
#    remove_column :articles, :gross_price
#
#    # == Order
#    drop_table :orders
#    drop_table :group_order_results
#    drop_table :order_article_results
#    drop_table :group_order_article_results
#    GroupOrder.delete_all; OrderArticle.delete_all; GroupOrderArticle.delete_all; GroupOrderArticleQuantity.delete_all
#
#    create_table :orders do |t|
#      t.references :supplier
#      t.text :note
#      t.datetime :starts
#      t.datetime :ends
#      t.string :state, :default => "open"   # Statemachine ... open -> finished -> closed
#      t.integer :lock_version, :default => 0, :null => false
#      t.integer :updated_by_user_id
#    end
#
#    # == Invoice
#    add_column :invoices, :order_id, :integer
#    add_column :invoices, :deposit, :decimal, :precision => 8, :scale => 2, :default => 0.0,  :null => false
#    add_column :invoices, :deposit_credit, :decimal, :precision => 8, :scale => 2, :default => 0.0,  :null => false
#
#    # == Comment
#    drop_table :comments
#    create_table :order_comments do |t|
#      t.references :order
#      t.references :user
#      t.text :text
#      t.datetime :created_at
#    end
#
#    # == ArticlePrice
#    create_table :article_prices do |t|
#      t.references :article
#      t.decimal :price, :precision => 8, :scale => 2, :default => 0.0, :null => false
#      t.decimal :tax, :precision => 8, :scale => 2, :default => 0.0, :null => false
#      t.decimal :deposit, :precision => 8, :scale => 2, :default => 0.0, :null => false
#      t.integer :unit_quantity
#      t.datetime :created_at
#    end
#    # Create price history for every Article
#    Article.all.each do |a|
#      a.article_prices.create :price => a.price, :tax => a.tax,
#        :deposit => a.deposit, :unit_quantity => a.unit_quantity
#    end
#    # Every Article has now a Category. Fix it if neccessary.
#    Article.all(:conditions => { :article_category_id => nil }).each do |article|
#        article.update_attribute(:article_category, ArticleCategory.first)
#    end
#    # order-articles
#    add_column :order_articles, :article_price_id, :integer
#
#    # == GroupOrder
#    change_column :group_orders, :updated_by_user_id, :integer, :default => nil, :null => true

    # == GroupOrderArticle
    # The total order result in ordergroup is now saved!
    add_column :group_order_articles, :result, :integer, :default => nil
  end

  def self.down
  end
end
