clear; close all; clc;
for name = ["q0b1","q0b2","q1b1","q1b2","q2a","q2b"]
    %name = "q2b";
    out = sim(name + ".slx");
    
    figure;
    plot(out.iin);
    saveas(gcf,name+'/iin.png')
    
    figure;
    plot(out.vin);
    saveas(gcf,name+'/vin.png')
    
    figure;
    plot(out.iout);
    saveas(gcf,name+'/iout.png')
    
    figure;
    plot(out.vout);
    saveas(gcf,name+'/vout.png')
    
    figure;
    plot(out.thd);
    saveas(gcf,name+'/thd.png')
    
    
    figure;
    signal = reshape(out.iin.data,[],1);
    fs = 14660;
    n = length(signal);
    fftSignal = fft(signal);
    shiftedSignal = fftshift(fftSignal);
    fshift = (-n/2:n/2-1)*(fs/n);
    plot(fshift, abs(shiftedSignal));
    xlim([-1000 1000])    
    xlabel('Frequency [Hz]');
    ylabel('Power');
    title('Spectrum Iin');
    saveas(gcf,name+'/spectrum.png')
end
clear; close all; clc;


