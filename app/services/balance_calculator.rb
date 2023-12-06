class BalanceCalculator

  def initialize(tricount)
    @tricount = tricount
    @expenses = Expense.where(tricount_id: @tricount.id)
    @participants = Participant.find_by(tricount_id: @tricount.id)
  end
  
  def calculate_balances
    total_paid_by_participant = Hash.new(0)

    # Calculer le total payé par chaque participant
    @expenses.each do |expense|
      total_paid_by_participant[expense.payer] += expense.amount_cents
      expense.debtors.reject(&:empty?).each do |debtor|
        total_paid_by_participant[debtor] -= expense.amount_cents / expense.debtors.size
      end
    end

    # Calculer la dépense moyenne par participant
    average_expense = total_paid_by_participant.values.sum / @participants.names.count.to_f

    # Comparer le total payé par chaque participant avec la dépense moyenne
    balances = Hash.new(0)
    total_paid_by_participant.each do |participant, total_paid|
      balances[participant] = total_paid - average_expense
    end

    # Générer la liste des transactions pour équilibrer les comptes
    transactions = generate_transactions(balances)

    { balances: balances, transactions: transactions }
  end

  private

  def generate_transactions(balances)
    transactions = []
    positive_balances, negative_balances = balances.partition { |_participant, balance| balance.positive? }

    positive_balances.each do |creditor, creditor_balance|
      negative_balances.reverse_each do |debtor, debtor_balance|
        if creditor_balance > 0 && debtor_balance < 0
          amount_to_transfer = [creditor_balance.abs, debtor_balance.abs].min
          transactions << { debtor: debtor, creditor: creditor, amount: amount_to_transfer }
          creditor_balance -= amount_to_transfer
          debtor_balance += amount_to_transfer
        end
      end
    end

    transactions
  end

end
