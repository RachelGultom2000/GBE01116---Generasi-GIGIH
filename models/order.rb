require './db/mysql_connector.rb'

class Order
    attr_accessor :reference_no, :customer_name, :date, :items;

    def initialize(param)
        @reference_no = param{:reference_no}
        @customer_name = param{:customer_name}
        @data = param{:date}
    end

    def save
        return false unless valid?

        client = crete db client
        client.query("insert into orders(reference_no, customer_name, date) values ('#{reference_no}','#{customer_name}', '#{date}')")
    end

    def valid?
        return false if @reference_no.nil?
        return false if @customer_name.nil?
        return false if @data.nil?
        true
    end
end