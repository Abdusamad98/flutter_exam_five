part of 'all_category_cubit.dart';


class AllCategoryState extends Equatable {
   AllCategoryState({required this.formzStatus, required this.errorText, required this.category});
   final List<CategoryItem> category;
   final FormzStatus formzStatus;
   final String errorText;



   AllCategoryState copyWith({
     List<CategoryItem>? category,
     String? errorText,
     FormzStatus? formzStatus,
   }) =>
       AllCategoryState(
           formzStatus: formzStatus ?? this.formzStatus,
           category: category ?? this.category,
           errorText: errorText ?? this.errorText);

   @override
   List<Object> get props => [
     formzStatus,
     category,
     errorText
   ];

}




// class BooksState extends Equatable {
//   BooksState(
//       {required this.formzStatus,
//         required this.books,
//         required this.errorText});
//
//   final List<BookModel> books;
//   final FormzStatus formzStatus;
//   final String errorText;
//
//   BooksState copyWith({
//     List<BookModel>? books,
//     String? errorText,
//     FormzStatus? formzStatus,
//   }) =>
//       BooksState(
//           formzStatus: formzStatus ?? this.formzStatus,
//           books: books ?? this.books,
//           errorText: errorText ?? this.errorText);
//   @override
//   List<Object>get props =>[
//     books,
//     formzStatus,
//     errorText
//   ];
// }
