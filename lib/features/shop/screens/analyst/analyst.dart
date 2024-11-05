import 'package:flutter/material.dart';
import 'package:flutter_structure/data/services/database/todo_db.dart';
import 'package:flutter_structure/data/services/datebase_services.dart';
import 'package:flutter_structure/features/shop/models/todo.dart';
import 'package:flutter_structure/features/shop/screens/budget/budget.dart';
import 'package:flutter_structure/utils/constants/colors.dart';
import 'package:intl/intl.dart';

class Analyst extends StatefulWidget {
  const Analyst({super.key});

  @override
  State<Analyst> createState() => _AnalystState();
}

class _AnalystState extends State<Analyst> {
  Future<List<Todo>>? futureTodos;
  final todoDB = TodoDb();


  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  void fetchTodos() {
    setState(() {
      futureTodos = todoDB.fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (_) => CreateTodoWidget(
            onSubmit: (title) async {
              await todoDB.create(title: title);
              if(!mounted) return;
              fetchTodos();
              Navigator.of(context).pop();
            },
          ),);
        },
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodos,
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            final todos = snapshot.data!;

            return todos.isEmpty
                ? const Center(child: Text('No todos'))
                : ListView.separated(
                itemBuilder: (context,index) {
                  final todo = todos[index];
                  final subtitle = DateFormat('yyyy/MM/dd').format(DateTime.parse(todo.updatedAt ?? todo.createdAt));
                  final subtime = DateFormat('HH:mm').format(DateTime.parse(todo.updatedAt ?? todo.createdAt));

                  return ListTile(
                    title: Text(todo.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('$subtitle $subtime'),
                    trailing: IconButton(
                      onPressed: () async {
                        await todoDB.delete(todo.id);
                        fetchTodos();
                      },
                      icon: const Icon(Icons.delete,color: Colors.red,),
                    ),
                    onTap: () {
                      showDialog(context: context, builder: (context) => CreateTodoWidget(todo: todo,
                      onSubmit: (title) async {
                        await todoDB.update(id: todo.id,title: title);
                        fetchTodos();
                        if(!mounted) return;
                        Navigator.of(context).pop();
                      },));
                    },
                  );
                }, separatorBuilder: (context,index) => const SizedBox(height: 12,), itemCount: todos.length);
          }
        },
      ),
    );
  }


}


class CreateTodoWidget extends StatefulWidget {
  final Todo? todo;
  final ValueChanged<String> onSubmit;

  const CreateTodoWidget({
    Key? key,
    this.todo,
    required this.onSubmit
  }) : super(key: key);


  @override
  State<CreateTodoWidget> createState() => _CreateTodoWidgetState();
}

class _CreateTodoWidgetState extends State<CreateTodoWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

    controller.text = widget.todo?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.todo != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Todo' : 'Add Todo'),
      content: Form(
        key: formKey,
        child: TextFormField(
          autofocus: true,
          controller: controller,
          decoration: const InputDecoration(hintText: 'Title'),
          validator: (value) =>
          value != null && value.isEmpty ? 'Title is required' : null,
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        TextButton(onPressed: (){
          if(formKey.currentState!.validate()){
            widget.onSubmit(controller.text);
          }
        }, child: const Text('OK')),
      ],


    );
  }
}

