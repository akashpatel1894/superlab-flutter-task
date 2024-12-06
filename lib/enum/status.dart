enum Status { pending, inprogress, completed }

extension EndpointExtension on Status {
  String value() {
    switch (this) {
      case Status.pending:
        return 'pending';
      case Status.inprogress:
        return 'inprogress';
      case Status.completed:
        return 'completed';
    }
  }
}
