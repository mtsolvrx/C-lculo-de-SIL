syms L
aux = input('Os elementos finais são valvulas ou motores? ','s');
if aux == 'valvulas'
    Lin = input('Qual valor do λ do iniciador? ');
    Lel = input('Qual valor do λ do executor da lógica? ');
    Ls  = input('Qual valor do λ da solenóide? ');
    La  = input('Qual valor do λ do atuador? ');
    Lv  = input('Qual valor do λ da válvula? ');
    T   = input('Qual o intervalo do teste de prova (em horas)? ');
    Vin = input('Qual a votação do iniciadore? ','s');
    Vel = input('Qual a votação do executor da lógica? ','s');
    Vef = input('Qual a votação do elemento final? ','s');
    mi = str2double(Vin(1)); 
    ni = str2double(Vin(4)); 
    me = str2double(Vel(1)); 
    ne = str2double(Vel(4)); 
    mf = str2double(Vef(1)); 
    nf = str2double(Vef(4)); 

    VOT = [(L*T)/2 0 0;(L^2*T^2)/3 L*T 0;(L^3*T^3)/4 L^2*T^2 3*(L*T)/2;(L^4*T^4)/5 L^3*T^3 2*(L^2*T^2)];
    VOT = transpose(VOT)
    
    PFDavgin = subs(VOT(mi,ni),L,Lin)   
    
    PFDavgel = subs(VOT(me,ne),L,Lel) 
        
    Lt = Ls + La + Lv
    PFDavgef = subs(VOT(mf,nf),L,Lt) 
    
    PFDavg = PFDavgin + PFDavgel + PFDavgef
    
    if PFDavg >= 1e-2 && PFDavg < 1e-1
        SIL = 1
    elseif PFDavg >= 1e-3 && PFDavg < 1e-2
        SIL = 2
    elseif PFDavg >= 1e-4 && PFDavg < 1e-3
        SIL = 3
    else PFDavg >= 1e-5 && PFDavg < 1e-4
        SIL = 4
    end
elseif aux == 'motores'
    Lin = input('Qual valor do λ do iniciador? ');
    Lel = input('Qual valor do λ do executor da lógica? ');
    Ld  = input('Qual valor do λ do disjuntor? ');
    Lr  = input('Qual valor do λ do relé? ');
    T   = input('Qual o intervalo do teste de prova (em horas)? ');
    Vin = input('Qual a votação do iniciadore? ','s');
    Vel = input('Qual a votação do executor da lógica? ','s');
    Vef = input('Qual a votação do elemento final? ','s');
    mi = str2double(Vin(1)); 
    ni = str2double(Vin(4)); 
    me = str2double(Vel(1)); 
    ne = str2double(Vel(4)); 
    mf = str2double(Vef(1)); 
    nf = str2double(Vef(4)); 
    
    VOT = [(L*T)/2 0 0;(L^2*T^2)/3 L*T 0;(L^3*T^3)/4 L^2*T^2 3*(L*T)/2;(L^4*T^4)/5 L^3*T^3 2*(L^2*T^2)];
    VOT = transpose(VOT)
    
    PFDavgin = subs(VOT(mi,ni),L,Lin)    
    
    PFDavgel = subs(VOT(me,ne),L,Lel) 
        
    Lt = Ld + Lr
    PFDavgef = subs(VOT(mf,nf),L,Lt) 
    
    PFDavg = PFDavgin + PFDavgel + PFDavgef
    
    if PFDavg >= 1e-2 && PFDavg < 1e-1
        SIL = 1
    elseif PFDavg >= 1e-3 && PFDavg < 1e-2
        SIL = 2
    elseif PFDavg >= 1e-4 && PFDavg < 1e-3
        SIL = 3
    else PFDavg >= 1e-5 && PFDavg < 1e-4
        SIL = 4
    end
end
%1.73e-7,3e-9,4.277e-7,4.277e-7,4.277e-7,2920