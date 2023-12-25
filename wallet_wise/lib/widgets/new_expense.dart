import 'package:flutter/material.dart';
import 'package:wallet_wise/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final Function(Expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text(
            'Invalid input',
          ),
          content: const Text('Please enter a valid title and amount!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    } else {
      widget.addExpense(
        Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            controller: _titleController,
          ),
          TextField(
            maxLength: 50,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
            controller: _amountController,
          ),
          Text(
            _selectedDate == null
                ? 'No Date Selected'
                : formatter.format(_selectedDate!),
          ),
          IconButton(
            alignment: Alignment.topLeft,
            onPressed: _presentDatePicker,
            icon: const Icon(Icons.calendar_month),
          ),
          DropdownButton(
            value: _selectedCategory,
            items: Category.values.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(
                  e.name.toUpperCase(),
                ),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
