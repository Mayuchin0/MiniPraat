%interfejs_menu_wersja_dluzsza



clc;
clear;
close all;
%pierwsze menu z wyborem importu lub instrukcji
my_options = {"Zaimportuj plik audio", "Instrukcja obslugi"};
[sel, ok] = listdlg ("ListString", my_options,
                     "SelectionMode", "Multiple","Name","Menu","ListSize",[300,160], "CancelString", "Anuluj");
%importujemy plik wav                    
if (sel == 1)
  
   printf('Prosze wybrac plik w formacie .wav')
   filename = uigetfile
   printf(filename)
   [y, Fs] = audioread (filename);
       
%drugie menu z wyborem metody  
  opcje = {"Metoda 1", "Metoda 2", "Metoda 3", "Metoda 4"};
  [sel] = listdlg("ListString", opcje, "SelectionMode", "Multiple", "Name", "Wybor metody","ListSize",[300,160], "CancelString", "Anuluj" );
  % metoda 1
  if (sel==1) 
    titleBarCaption = 'VOLUME';
    while(1)
    promptMessage = sprintf('Current Volume Level: %d%%\n',round(100*rand(1)));
    h=questdlg(promptMessage, titleBarCaption, 'Continue', 'Cancel', 'Continue');
    switch h
      case 'OK'
      case 'Cancel'
       break
    otherwise
    endswitch
    
  %odtwarzamy plik audio
    opcje2 = {"Odtworz plik  audio"};
    [sel,ok] = listdlg("ListString", opcje2, "SelectionMode", "Single", "Name", "Odtwarzacz","ListSize",[300,160], "CancelString", "Anuluj" );
    endwhile
    if (ok==1)
      player=audioplayer(y, Fs);
      play(player);

    endif
  
  %menu z guzikami play, pause, stop
  my_options = {"Play", "Pause","Stop"};
  [ sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Multiple","Name","Menu","ListSize",[300,160], "CancelString", "Anuluj"); 
  while (sel<=3)

    switch sel
       case 1 %guzik resume
        resume(player);
         my_options = {"Play", "Pause","Stop"};
        [ sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Multiple","Name","Menu","ListSize",[300,160], "CancelString", "Anuluj");  
       case 2 %guzik pause
        pause(player);   
        my_options = {"Play", "Pause","Stop"};
        [ sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Multiple","Name","Menu","ListSize",[300,160], "CancelString", "Anuluj");
        
       case 3 %guzik stop
        stop(player);
        my_options = {"Play", "Pause","Stop"};
        [ sel, ok] = listdlg ("ListString", my_options,
                       "SelectionMode", "Multiple","Name","Menu","ListSize",[300,160], "CancelString", "Anuluj");

        otherwise
    end
  endwhile  
 
  elseif (sel == 2)
    msgbox("Metoda 2 jest jeszcze nie gotowa");
  elseif (sel == 3)
    msgbox("Metoda 3 jest jeszcze nie gotowa");
  elseif (sel == 4)
    msgbox("Metoda 4 jest jeszcze nie gotowa");
  else
    close all;
  endif
    
  
elseif (sel == 2)
  msgbox ("To jest instrukcja obsugi programu Control Freak. Zaimportuj plik audio z dysku, nastepnie wybierz metode kontrolowania glosnosci", "Instrukcja obsugi");
else 
  close all;
 

endif