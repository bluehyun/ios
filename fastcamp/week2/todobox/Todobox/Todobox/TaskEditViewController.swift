import UIKit

class TaskEditViewController: UIViewController {

  @IBOutlet var textField: UITextField!
  var didAddTask: ((Task) -> Void)?
  
  @IBAction func cancelButtonDidTap(){
    textField.resignFirstResponder()
    self.dismiss(animated: true, completion: nil )
  }
    
  @IBAction func doneButtionDidTap(){
    
    guard let title = textField.text, !title.isEmpty else {
      shakeTextField()
      return
    }
    let task = Task(title: title, isDone : false)
    didAddTask?(task)
    textField.resignFirstResponder()
    self.dismiss(animated: true, completion: nil)
    
  }
  
  func shakeTextField(){
    UIView.animate(
      withDuration: 0.3,
      animations: {
        self.textField.frame.origin.x += 10
      },
      completion: { _ in
        UIView.animate(
          withDuration: 0.3,
          animations: {
            self.textField.frame.origin.x -= 20
          },
          completion: { _ in
            UIView.animate(
              withDuration: 0.1,
              animations: {
                self.textField.frame.origin.x += 10
              },
              completion: { _ in
              }
            )
          }
        )
      }
    )
  }
  
}
