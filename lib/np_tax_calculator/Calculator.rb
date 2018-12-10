module NpTaxCalculator
  class TaxCalculator
    def initialize
      @tax_law_single = [{ 'id' => 1, 'fiscal_year' => '75/76', 'taxable_amount' => 0.35e6, 'upper_bound' => 0.35e6, 'tax_rate' => 1 },
                         { 'id' => 2, 'fiscal_year' => '75/76', 'taxable_amount' => 0.1e6, 'upper_bound' => 0.45e6, 'tax_rate' => 10 },
                         { 'id' => 3, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e6, 'upper_bound' => 0.65e6, 'tax_rate' => 20 },
                         { 'id' => 4, 'fiscal_year' => '75/76', 'taxable_amount' => 0.135e7, 'upper_bound' => 0.2e7, 'tax_rate' => 30 },
                         { 'id' => 5, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e7, 'upper_bound' => 0.1e14, 'tax_rate' => 36 }]
      @tax_law_married = [{ 'id' => 6, 'fiscal_year' => '75/76', 'taxable_amount' => 0.4e6, 'upper_bound' => 0.4e6, 'tax_rate' => 1 },
                          { 'id' => 7, 'fiscal_year' => '75/76', 'taxable_amount' => 0.1e6, 'upper_bound' => 0.5e6, 'tax_rate' => 10 },
                          { 'id' => 8, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e6, 'upper_bound' => 0.7e6, 'tax_rate' => 20 },
                          { 'id' => 9, 'fiscal_year' => '75/76', 'taxable_amount' => 0.13e7, 'upper_bound' => 0.2e7, 'tax_rate' => 30 },
                          { 'id' => 10, 'fiscal_year' => '75/76', 'taxable_amount' => 0.2e7, 'upper_bound' => 0.1e14, 'tax_rate' => 36 }]
      @selector = @tax_law_single
      @past_slab_ub = 0
    end

    def calculate_tax(annual_taxable_income, tax_status)
      user_taxes = []
      tax_status == 'Married' ? @selector = @tax_law_married : @selector = @tax_law_single
      @selector.each do |i|
        if annual_taxable_income > i['upper_bound'].to_i
          tax_amount = (i['tax_rate'].to_i / 100.0) * i['taxable_amount'].to_i
          user_taxes.append([i['tax_rate'], tax_amount, i['taxable_amount']])
          @past_slab_ub = i['upper_bound'].to_i
        else
          amount_on = annual_taxable_income - @past_slab_ub
          tax_amount = (i['tax_rate'].to_i / 100.0) * amount_on
          user_taxes.append([i['tax_rate'], tax_amount, amount_on])
          return user_taxes
        end
      end
    end
  end
end
