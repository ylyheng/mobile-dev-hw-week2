class BankAccount {
  // TODO
  final int _accountId;
  final String _accountOwner;
  double _balance;

  BankAccount(this._accountId, this._accountOwner) : _balance = 0;

  int get accountId => _accountId;
  String get accountOwner => _accountOwner;

  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw BankException('Amount must be greater than 0!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw BankException('Amount must be greater than 0!');
    }
    if (_balance - amount < 0) {
      throw BankException('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  // TODO
  final String name;
  final List<BankAccount> _accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw BankException('Account with ID $accountId already exists!');
      }
    }
    final newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

class BankException implements Exception {
  final String message;
  BankException(this.message);

  @override
  String toString() => message;
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
