import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_exam_five/data/models/category.dart';
import 'package:flutter_exam_five/data/repositories/books_repository.dart';
import 'package:formz/formz.dart';

part 'all_category_state.dart';

class AllCategoryCubit extends Cubit<AllCategoryState> {
  AllCategoryCubit({required this.repository}) : super(AllCategoryState(formzStatus: FormzStatus.pure,errorText: "",category: []));
  final Repository repository;
  void getAllCategory()async{
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try{
      var category= await repository.getAllCategory();
      emit(state.copyWith(formzStatus: FormzStatus.submissionSuccess,category: category));
    }catch(error){
      emit(state.copyWith(formzStatus: FormzStatus.submissionFailure, errorText:  "GETALLCATEGORYERRRRR"));
    }
  }
}



// class BooksCubit extends Cubit<BooksState> {
//   BooksCubit({required this.bookRepository})
//       : super(
//     BooksState(
//       books: [],
//       formzStatus: FormzStatus.pure,
//       errorText: "",
//     ),
//   );
//   final BookRepository bookRepository;
// //-----------------------------GET ALL Book-------------
//   void getAllBooks()async{
//     emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
//     try{
//       var books= await bookRepository.getAllBook();
//       emit(state.copyWith(
//         formzStatus: FormzStatus.submissionSuccess,
//         books: books,
//       ),
//       );
//     } catch(error){
//       emit(state.copyWith(
//         formzStatus: FormzStatus.submissionFailure,
//         errorText: "getAllError",
//       ),
//       );
//     }
//   }
//   // ------------------------DELETE BOOK  BY ID----------------
//   void deleteBookById(int id) async{
//     emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
//     try{
//       bool isRemoved= await bookRepository.deleteBookById(id: id);
//       if(isRemoved){
//         getAllBooks();
//       }
//     }catch(error){
//       emit(state.copyWith(formzStatus: FormzStatus.submissionFailure,
//           errorText: "deleteBookError"
//       ));
//     }
//   }
//   //--------------------- ADD BOOK------------------------------
//   void addBook(BookModel bookModel) async {
//     emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
//     try {
//       var fullBook = await bookRepository.addBook(bookModel: bookModel);
//       if (fullBook.id > 0) {
//         getAllBooks();
//       }
//     } catch (error) {
//       emit(
//         state.copyWith(
//           formzStatus: FormzStatus.submissionFailure,
//           errorText: "addBookError",
//         ),
//       );
//     }
//   }
// }