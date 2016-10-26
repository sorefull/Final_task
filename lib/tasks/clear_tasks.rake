desc "Clears canceled order"
# anceled order 'lives' 24-47 hours
task :order_cleaner => :environment do |_, args|
  Order.where(status: :canceled).where("updated_at <= ?", 1.day.ago.utc).each do |old_canceled_order|
    old_canceled_order.destroy
  end
end

desc "Clears old unaproved reviews"
# anceled order 'lives' 24-47 hours
task :review_cleaner => :environment do |_, args|
  Review.where(approved: false).where("created_at <= ?", 10.day.ago.utc).each do |old_unapproved_review|
    old_unapproved_review.destroy
  end
end
