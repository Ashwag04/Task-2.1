import 'dart:io';

class Note{
  String Title;
  String content;
  String time;

  Note({required this.Title, required this.content, required this.time});
}

int count = 0;


class TheApp{
  List<Note> Notes = [];
  //count how many notes
  

  //CRUD methods

  void Create(){
    print("Enter the title: ");
    //null saftey
    String title = stdin.readLineSync() ?? " ";

    print("The time: ");
    String time = stdin.readLineSync() ?? " ";

    print("Bring what's in your mind!:");
    String content = stdin.readLineSync() ?? " ";

    Notes.add(Note(Title: title, content: content, time: time));
    count++;
    print("Your note added successfully :)");
  }

  void Search(){
    if (Notes.isEmpty){
      return;
    } 

    print("Enter the title you want to search for: ");
    String? STitle = stdin.readLineSync();

    Note? SNote = Notes.firstWhere((element) => element.Title == STitle, 
    orElse: () => Note(Title: " ",content: " ", time: " "),);

      if(SNote == null){
        print("Sorry. Note not found");
        return;
      }

      print("Title: ${SNote.Title}");
      print("Time: ${SNote.time}");
      print("Content: \n ${SNote.content}");

    }
  

  void Edit(){
    if (Notes.isEmpty){
      return;
    } 

    print("Enter the title you want to search for: ");
    String? STitle = stdin.readLineSync();

    //Note? EditNote;
    // to find the note in the list
    // for(Note note in Notes){
    //   if(EditNote.Title == STitle){
    //     EditNote = note;
    //     break;
    //   }

    Note? EditNote = Notes.firstWhere((element) => element.Title == STitle, 
    orElse: () => Note(Title: " ",content: " ", time: " "),);

      if(EditNote == null){
        print("Sorry. Note not found");
        return;
      }

      print("Enter new title: ");
      String? newTitle = stdin.readLineSync();
      EditNote.Title = newTitle ?? EditNote.Title;

      print("Enter new content: ");
      String? newContent = stdin.readLineSync();
      EditNote.content = newContent ?? EditNote.content;

      print("Enter new time: ");
      String? newTime = stdin.readLineSync();
      EditNote.time = newTime ?? EditNote.time;

      print("Your note edited successfully");

    }

    void Delete(){
      if (Notes.isEmpty){
      return;
    } 

    print("Enter the title you want to search for: ");
    String? STitle = stdin.readLineSync();

    Note? DeletNote = Notes.firstWhere((element) => element.Title == STitle, 
    orElse: () => Note(Title: " ",content: " ", time: " "),);

      if(DeletNote == null){
        print("Sorry. Note not found");
        return;
      }

      Notes.remove(DeletNote);
      count--;
      print("Note deleted successsfully");
    }

    void StartPoint(){
    print("Welcome aboard!. Let's begin organizing your thoughts \n\n");
    while(true){
      print("${count} Notes");
      print("\nWhat do you need?\n");
      print("1- Create note");
      print("2- Read note");
      print("3- Edit note");
      print("4- Delete note");
      print("5- Exit");

      print("Enter your choice: ");
      String? choice = stdin.readLineSync();

      switch (choice){
        case '1':
        Create();
        break;

        case '2':
        Search();
        break;

        case '3':
        Edit();
        break;

        case '4':
        Delete();
        break;

        case '5':
        print("Have a nice day!");
        return;

      }
    }
  }

  }

void main(){
  TheApp().StartPoint();
}

  