# Assignment 2

This assignment was made in collaboration with: Ana Karina Ballesteros Gómez, Ángela Gómez Sacristán, Mariam El Akal Chaji, Marta Fernández González and Paula Fernández Aldama. 

It consisted in the following: 

A recent paper (DOI: 10.1371/journal.pone.0108567) executes a meta-analysis of a few thousand published co-expressed gene sets from Arabidopsis.  They break these co-expression sets into ~20 sub-networks of <200 genes each, that they find consistently co-expressed with one another.  Assume that you want to take the next step in their analysis, and see if there is already information linking these predicted sub-sets into known regulatory networks.  
One step in this analysis would be to determine if the co-expressed genes are known to bind to one another.

Using the co-expressed gene list from Table S2 of the supplementary data from their analysis (it is the txt file attached in this folder):

1. Use a combination of any or all of:  dbFetch, Togo REST API, EBI’s PSICQUIC REST API, DDBJ KEGG REST, and/or the Gene Ontology. 
2. Find all protein-protein interaction networks that involve members of that gene list.
3. Determine which members of the gene list interact with each other.

For running the code use: ruby Main.rb ArabidopsisSubNetwork_GeneList.txt

In the final_report.txt file you can see the example of the output networks that is generated by the program, for genes filtered by Arabidopsis taxid and with a score of 0.5 (of course this parameters can be modified in the InteractionNetwork.rb script). 

# Bibliography

1. Append key/value pair to hash with &lt;&lt; in ruby. Stack Overflow. Retrieved November 26, 2022, from https://stackoverflow.com/questions/19756139/append-key-value-pair-to-hash-with-in-ruby 

2. Como USAR .nil? .empty? .blank? y .present? Correctamente Ruby on rails. Antonio Pérez. Retrieved November 26, 2022, from https://antonioperez.pro/como-usar-nil-empty-blank-y-present-correctamente-en-ruby-on-rails/ 

3. Fetch function. Retrieved November 26, 2022, from https://github.com/CBGP-UPM-INIA-PUBLIC/BioinformaticsRetos-1-4/blob/main/Lectures/Lesson%203%20-%20Web%20access%20from%20code.ipynb

4. How can I uppercase each element of an array? Stack Overflow. Retrieved November 26, 2022, from https://stackoverflow.com/questions/11402362/how-can-i-uppercase-each-element-of-an-array 

5. Otieno, J. (1969, January 1). Ruby array delete element. Retrieved November 26, 2022, from https://linuxhint.com/ruby-array-delete-element/ 

6. Pankowecki, R. (n.d.). Nil?, empty?, blank? in ruby on rails - what's the difference actually? Arkency Blog. Retrieved November 29, 2022, from https://blog.arkency.com/2017/07/nil-empty-blank-ruby-rails-difference/ 

7. Ruby - string split() method with examples. GeeksforGeeks. (2020, July 3). Retrieved November 26, 2022, from https://www.geeksforgeeks.org/ruby-string-split-method-with-examples/ 

8. Ruby (rails): Remove whitespace from each array item. Stack Overflow. Retrieved November 26, 2022, from https://stackoverflow.com/questions/3926190/ruby-rails-remove-whitespace-from-each 




