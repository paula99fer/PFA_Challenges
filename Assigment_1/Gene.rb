require 'csv'

class Gene

  @@gene_list = Array.new

  attr_accessor :gene_id
  attr_accessor :gene_name
  attr_accessor :phenotype
  attr_accessor :linked
       
  def initialize(gene_id: nil, gene_name: nil, phenotype: nil, linked: nil)
    @gene_id = gene_id
    @gene_name = gene_name
    @phenotype = phenotype
    @linked = Hash.new
    @@gene_list.append(self)

    format_gene = /A[Tt]\d[Gg]\d\d\d\d\d/ 
    unless format_gene.match(@gene_id)
      abort("Wrong ID format for #{@gene_id}")
    end

  end
  
  def self.uploadfile(geneinfo_file)
    geneinfo_table = CSV.read(geneinfo_file, headers: true, col_sep: "\t")
    @geneinfo_header = geneinfo_table.headers 
    i = 0
    geneinfo_table.each do |row|
       @@gene_list[i] =   Gene.new(gene_id: row[0], gene_name: row[1], phenotype: row[2])
       i = i+1
    end 
    return @@gene_list
  end

  def self.get_name(x) 
    @@gene_list.each do |seed|
       return seed.gene_name if seed.gene_id == x
    end
 end

  def self.add_linked(gene, chi)
    @linked = chi
  end

end
