class DashboardController < ApplicationController

    def index
        @sales_by_month = Sale.group_by_month(:sale_date, last: 12, format: "%b %Y").order(sale_date: :asc).sum(:price)
        @sales_by_count = Sale.group_by_month(:sale_date, last: 12, format: "%b %Y").order(sale_date: :asc).count
        @sales_by_average = Sale.group_by_month(:sale_date, last: 12, format: "%b %Y").order(sale_date: :asc).average(:price)
        @sales_origin_12 = Sale.where('sale_date >= ?', 1.year.ago.to_datetime).group(:origin).count
        @sales_origin_6 = Sale.where('sale_date >= ?', 6.month.ago.to_datetime).group(:origin).count
        @sales_origin_3 = Sale.where('sale_date >= ?', 3.month.ago.to_datetime).group(:origin).count
        @sales_origin_1 = Sale.where('sale_date >= ?', 1.month.ago.to_datetime).group(:origin).count
        @sales_blend_name_12 = Sale.where('sale_date >= ?', 1.year.ago.to_datetime).group(:blend).count
        @sales_blend_name_6 = Sale.where('sale_date >= ?', 6.month.ago.to_datetime).group(:blend).count
        @sales_blend_name_3 = Sale.where('sale_date >= ?', 3.month.ago.to_datetime).group(:blend).count
        @sales_blend_name_1 = Sale.where('sale_date >= ?', 1.month.ago.to_datetime).group(:blend).count
        @sales_months = Sale.group("strftime('%m-%Y', sale_date)").order(sale_date: :asc).sum(:price)
    end

end
