require 'date'
require 'csv'

class Seed

   @@seed_list = Array.new 
   
   attr_accessor :seed_stock
   attr_accessor :gene_id
   attr_accessor :last_planted
   attr_accessor :storage
   attr_accessor :grams_remain

   def initialize(seed_stock: nil, gene_id: nil, last_planted: nil, storage: nil, grams_remain: nil)
      @seed_stock = seed_stock
      @gene_id = gene_id
      @last_planted = last_planted
      @storage = storage
      @grams_remain = grams_remain.to_i
      @@seed_list.append(self)
   
   end

   def self.uploadfile(seed_stock_file)
      seed_table = CSV.read(seed_stock_file, headers: true, col_sep: "\t")
      @seed_header = seed_table.headers 
      i = 0
      seed_table.each do |row|
         @@seed_list[i] = Seed.new(seed_stock: row[0], gene_id: row[1], last_planted: row[2], storage: row[3], grams_remain: row[4])
         i = i+1
      end 
      return @@seed_list
   end

   def plant(number)
      @grams_remain -= number
      if @grams_remain <= 0
         puts "There are not enough seeds for planting #{@seed_stock}."
         @grams_remain = 0
      end
      @last_planted = DateTime.now.strftime("%d/%m/%Y")
   end

   def self.savechanges(new_seed_file)
      new_table =  File.open(new_seed_file, 'w')
      new_table.puts(@seed_header.join("\t"))
      @@seed_list.each do |newstook|
         new_table.puts([newstook.seed_stock, newstook.gene_id, newstook.last_planted, newstook.storage, newstook.grams_remain].join("\t"))
      end
   end

   def self.get_ID(seed) 
      @@seed_list.each do |stock|
         return stock.gene_id if stock.seed_stock == seed
      end
   end

end