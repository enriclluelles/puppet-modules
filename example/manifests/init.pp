class example (
 $notify_message = 'Hello, this is the default message',
){

  notify { $example::notify_message: }

}
