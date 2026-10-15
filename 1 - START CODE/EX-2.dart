class BankAccount {
  final int _accountId;
  final String _accountOwner;
  double _balance;

  BankAccount(this._accountId, this._accountOwner) : _balance = 0;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;

  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be greater than 0!');
    }
    if (_balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }
    final newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // 0.0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // 100.0
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // 50.0

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Exception: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Exception: Account with ID 100 already exists!
  }
}