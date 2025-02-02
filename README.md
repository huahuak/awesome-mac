# ohmymac

[ohmymac](https://github.com/huahuak/ohmymac) is a menubar-only application, which is used to extend functionality of mac.

*ohmymac is currently under development.*

##  Features

### Window

#### Design Philosophy

- When using MacBook, I will lose direction in multiple windows and spaces, Because window and Space switch logic is so complex. For Example, when I change to another space, I will forget the old windows when need to go back.

- So I need to **remember the most recent windows** (just record the order of the openning windows) globally.

  **Basic Rule**

  | Condition                                 | Action                                                       | Done |
  | :---------------------------------------- | :----------------------------------------------------------- | :--: |
  | When window unhide/activate               | append applicatoin icon to menubar.                          |  ✅   |
  | When window hide/close                    | remove application icon from menubar.                        |  ✅   |
  | When click application icon on menubar    | switch to last activated window.                             |  ✅   |
  | When press `Cmd+Tab`                      | switch to last activated window.                             |  ✅   |
  | When click applition icon with flag `Opt` | close the last activated window of the being clicked application. |  ✅   |

- How to work with the window features of ohmymac?
  1. Just use StageManager/Mission-Control/Dock to find your **target** application and window, but use ohmymac to find your **the most recent activated window**.
  2. FullScreen: You can set menubar always show,  So you can use ohmymac to find window quicklly. (without Mission Control or dock)

#### Description

- You will find the **most recent three** windows in the menu bar.

  ![Screenshot 2024-03-14 at 23.09.30](README.assets/Screenshot%202024-03-14%20at%2023.09.30.png)

- `cmd+tab` has been overwritten by ohmymac, when you press `cmd+tab`, the menubar will show a list of all windows, and it will hightlight the selected window.

  (In the fucture, you may be able to choose your custom shortcut instead of `cmd+tab`)

  ![Screenshot 2024-03-14 at 23.12.15](README.assets/Screenshot%202024-03-14%20at%2023.12.15-0429150.png)

- When the mouse enters the menu bar area of ohmymac, the menu bar will show a list of all windows, and it will hide when the mouse exits.

### Shortcut

- `cmd+opt+g`: To select some text, then call google search in little window. it works when in fullscreen, allowing you to avoid switching windows when you need to perform a Google search. You can close the window by pressing `Cmd+W`. You can open website in the google by pressing `Cmd+O`.

  ![Screenshot 2024-03-05 at 15.58.29](README.assets/Screenshot%202024-03-05%20at%2015.58.29.png)

- `opt+,`: To translate a text and display it side-by-side, simply enter `\space` to close the window. 

  ![Screenshot 2024-03-05 at 13.36.43](README.assets/Screenshot%202024-03-05%20at%2013.36.43-9617654.png)

  > ‼️ you must install a shortcut in mac, which named "apple-translator", because this function relies on the internal Apple Translate feature, it doesn't require an internet connection.
  >
  > ![Screenshot 2024-03-05 at 13.39.10](README.assets/Screenshot%202024-03-05%20at%2013.39.10-9617654.png)

- `opt+l` / `opt+;` / `opt+'` / `opt+m`: adjust window size to small, middle, large, full.

  ![Screenshot 2024-03-05 at 13.58.40](README.assets/Screenshot%202024-03-05%20at%2013.58.40.png)

