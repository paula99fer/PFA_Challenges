require 'csv'
require './Seed'
require './Gene'

class Cross

    @@cross_list = Array.new
        
    attr_accessor :parent1
    attr_accessor :parent2
    attr_accessor :f2_wild
    attr_accessor :f2_p1
    attr_accessor :f2_p2
    attr_accessor :f2_p1p2
    
    def initialize(parent1: nil, parent2: nil, f2_wild: nil, f2_p1: nil, f2_p2: nil, f2_p1p2: nil)
        @parent1 = parent1
        @parent2 = parent2
        @f2_wild = f2_wild.to_f
        @f2_p1 = f2_p1.to_f
        @f2_p2 = f2_p2.to_f
        @f2_p1p2 = f2_p1p2.to_f
        @@cross_list.append(self)
    end

    def self.uploadfile(cross_data_file)
        cross_table = CSV.read(cross_data_file, headers: true, col_sep: "\t")
        @cross_header = cross_table.headers 
        i = 0
        cross_table.each do |row|
           @@cross_list[i] = Cross.new(parent1: row[0], parent2: row[1], f2_wild: row[2], f2_p1: row[3], f2_p2: row[4], f2_p1p2: row[5])
           i = i+1
        end 
        return @@cross_list
    end
    
    def chisquare
        total_obs = f2_wild + f2_p1 + f2_p2 + f2_p1p2
        exp =  [total_obs * 9/16 , total_obs * 3/16, total_obs * 3/16, total_obs * 1/16]
        chiwild = (@f2_wild - exp[0])**2 / exp[0]
        chip1 = (@f2_p1 - exp[1])**2 / exp[1]
        chip2 = (@f2_p2 - exp[2])**2 / exp[2]
        chip1p2 = (@f2_p1p2 - exp[3])**2 / exp[3]
        chi = chiwild + chip1 + chip2 + chip1p2

        if (chi > 7.81)
            id_cross1 = Seed.get_ID("#{@parent1}")
            name_cross1 = Gene.get_name(id_cross1)
            id_cross2 = Seed.get_ID("#{@parent2}")
            name_cross2 = Gene.get_name(id_cross2)
            puts "#{name_cross1} is genetically linked to #{name_cross2} with a chi square of #{chi}"
        end
    end

    def finalreport
        total_obs = f2_wild + f2_p1 + f2_p2 + f2_p1p2
        exp =  [total_obs * 9/16 , total_obs * 3/16, total_obs * 3/16, total_obs * 1/16]
        chiwild = (@f2_wild - exp[0])**2 / exp[0]
        chip1 = (@f2_p1 - exp[1])**2 / exp[1]
        chip2 = (@f2_p2 - exp[2])**2 / exp[2]
        chip1p2 = (@f2_p1p2 - exp[3])**2 / exp[3]
        chi = chiwild + chip1 + chip2 + chip1p2
        
        if (chi > 7.81)
            id_cross1 = Seed.get_ID("#{@parent1}")
            name_cross1 = Gene.get_name(id_cross1)
            id_cross2 = Seed.get_ID("#{@parent2}")
            name_cross2 = Gene.get_name(id_cross2)
            puts "#{name_cross1} is linked to #{name_cross2}"
            puts "#{name_cross2} is linked to #{name_cross1}"
            Gene.add_linked(name_cross2, chi)
            Gene.add_linked(name_cross1, chi)
        end
    end

end