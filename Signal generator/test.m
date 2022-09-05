time = 0:1/1000:(0.5 -1/1000);

for i=1:3
    amplitude = input("Enter amplitude");
    frequency = input("Enter frequency");
    
    sine = amplitude*(cos(2*pi*frequency*time));
  
    sinevariations(i,:) = sine;
    
    tiledlayout(2,1)
    nexttile
    plot(time,sine)
    title('Top Plot')
    
    nexttile
    plot(time,sinevariations)
    title('Below Plot')
end