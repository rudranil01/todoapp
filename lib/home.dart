import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';
import '../Constants/colors.dart';
import '../widgets/todo_item.dart';
//import 'package:todoapp/widgets/todo_item.dart';
//import 'package:todoapp/Constants/colors.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final todoslist = ToDo.todoList();
  final _todoController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,

      appBar: _buildAppBar(),

      body: Stack(
        children: [

          Container(

            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
              child: Column(


                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      // height: 20,
                      // width: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: TextField(
                          decoration: InputDecoration(
                           // contentPadding: EdgeInsets.only(top:20,bottom:20),
                              contentPadding: EdgeInsets.all(0),

                              prefixIcon: Icon(Icons.search,color: tdBlack,size: 20,),
                            prefixIconConstraints: BoxConstraints(
                              maxHeight: 20,
                              minWidth: 25,


                            ),
                            border: InputBorder.none,
                            hintText: 'Search it up nigga',
                            hintStyle: TextStyle(color: tdGrey),



                          ),

                        ),
                      ),
                    ),
                  ),
                  //search box is created
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                            left: 20,
                          ),
                          child: Text(
                              'All todos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),

                          ),
                        ),
                        for( ToDo todoo in todoslist )
                          ToDoItem(

                            todo: todoo,
                            onToDochanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoitem,
                          ),
                        // ToDoItem(),
                        // ToDoItem(),
                        // ToDoItem(),





                        // ListTile(
                        //   onTap: (){},
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20),
                        //   ),
                        //   tileColor: Colors.white,
                        //   leading: Icon(Icons.check_box,color: tdBlue,),
                        //
                        //   title: Text('first item eh?'),
                        //
                        //
                        //
                        // ),


                      ],
                    ),
                  )





                ],

              ),
            ),
          ),


          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0,0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),


                    ),

                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none
                      ),
                    ),
                    margin: EdgeInsets.only(
                        left: 20,bottom: 20,right: 20
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  ),


                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(fontSize: 40),),
                    onPressed: (){
                      _addToDoitem(_todoController.text);

                    },

                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60,60),
                      elevation: 10,


                    ),

                  ),


                )


              ],
            ),

          ),
        ],
      ),

    );

  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone=!todo.isDone;

    });

    // todo.isDone=!todo.isDone;

  }

  void _deleteToDoitem(String id){

    setState(() {
      todoslist.removeWhere((item) => item.id==id);

    });



  }
  void _addToDoitem(String toDo){
    setState(() {
      todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));

    });
    // todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
    //     todoText: toDo));
    _todoController.clear();

  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,

          ),
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset('assets/johan.jpg'),
            ),
          )
        ],
      ),

    );
  }
}
