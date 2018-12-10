module NpTaxCalculator
  class TaxCalculator
    def initialize(annual_taxable_income)
      @tax_law = [{ 'id' => 1, 'fiscal_year' => '75/76', 'taxable_amount' => 0.35e6, 'upper_bound' => 0.35e6, 'tax_rate' => 1 },
                  { 'id' => 2, 'fiscal_year' => '75/76', 'taxable_amount' => 0.1e6, 'upper_bound' => 0.45e6, 'tax_rate' => 10 },
                  { 'id' => 3, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e6, 'upper_bound' => 0.65e6, 'tax_rate' => 20 },
                  { 'id' => 4, 'fiscal_year' => '75/76', 'taxable_amount' => 0.135e7, 'upper_bound' => 0.2e7, 'tax_rate' => 30 },
                  { 'id' => 5, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e7, 'upper_bound' => 0.1e14, 'tax_rate' => 36 }]

      @income = annual_taxable_income
      @past_slab_ub = 0
    end

    def calculate_tax
      @tax_law.each do |i|
        if @income > i['upper_bound'].to_i
          tax_amount = (i['tax_rate'].to_i / 100.0) * i['taxable_amount'].to_i
          print(tax_amount)
          puts(' On ' + i['taxable_amount'].to_s)
          @past_slab_ub = i['upper_bound'].to_i
        else
          amount_on = @income - @past_slab_ub
          tax_amount = (i['tax_rate'].to_i / 100.0) * amount_on
          break
        end
      end
      
    end
  end
end
