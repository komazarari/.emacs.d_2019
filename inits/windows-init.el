;; 前提
;; C:\\msys64 に msys2 がインストールされている
;; C:\msys64\mingw64 に mingw がインストールされている
;; find, grep, diff, ag,... などがこのPATHで使える

;; MSYS2 のコマンドを使えるようにする. 
(setenv "PATH"
  (concat
   ;; 下記の行に MSYS2 のコマンドの実行可能ファイルがある場所を設定してください. スラッシュが2つ連続することに注意！
   ;; 区切り文字はセミコロン
   "C:\\msys64\\usr\\bin;"
   "C:\\msys64\\mingw64\\bin;"
   (getenv "PATH")))

;; 区切り文字はなし
;(setq exec-path (append exec-path '("C:\\Programs\\msys64\\usr\\bin")))
(setq exec-path (append exec-path '("C:\\msys64\\usr\\bin")))
(setq exec-path (append exec-path '("C:\\msys64\\mingw64\\bin")))
