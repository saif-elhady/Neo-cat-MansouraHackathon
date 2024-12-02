class Error {
  List<Error>? errors;

  Error({this.errors});

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errors: (json['errors'] as List<dynamic>?)
            ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'errors': errors?.map((e) => e.toJson()).toList(),
      };
}
