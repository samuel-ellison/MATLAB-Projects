clc; clear all; close all; rng('shuffle');

%% CHOOSE STYLE
fprintf('Choose a Color Style\n');
color = uisetcolor;
clc;

%% WINDOW
figure(8)
set(gcf, 'Position',  [1900, -200, 2000, 1200])

%% SOUNDS
load mydata.mat
filename = 'roll.wav';
audiowrite(filename,data,fs);
clear data fs
[data,fs] = audioread('roll.wav');

%% POSITIONS
x = [3, 4.5, 6, 7.5, 9];
y = [6, 6, 6, 6, 6];
x_out = x - 0.06;
y_out = y - 0.06;

%% BOARD
rectangle('Position', [2.5 0 8 5.5], 'FaceColor', 'w', 'LineWidth', 5)
hold on
xa1 = 3+2.5;
xa2 = 3+2.5;
ya1 = 0;
ya2 = 5.5;
plot([xa1 xa2], [ya1 ya2], 'k', 'LineWidth', 5)
hold on
xa1 = 6+2.5;
xa2 = 6+2.5;
ya1 = 0;
ya2 = 5.5;
plot([xa1 xa2], [ya1 ya2], 'k', 'LineWidth', 5)
hold on

text(2.75,5,'1) ONES','FontSize', 18, 'FontWeight', 'bold')
text(2.75,4.25,'2) TWOS','FontSize', 18, 'FontWeight', 'bold')
text(2.75,3.5,'3) THREES','FontSize', 18, 'FontWeight', 'bold')
text(2.75,2.75,'4) FOURS','FontSize', 18, 'FontWeight', 'bold')
text(2.75,2,'5) FIVES','FontSize', 18, 'FontWeight', 'bold')
text(2.75,1.25,'6) SIXES','FontSize', 18, 'FontWeight', 'bold')
text(2.75,0.5,'BONUS','FontSize', 18, 'FontWeight', 'bold')

rectangle('Position', [4.85 4.8 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 4.05 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 3.3 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 2.55 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 1.8 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 1.05 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [4.85 0.3 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)

text(5.75,5,'7) 3 OF A KIND','FontSize', 18, 'FontWeight', 'bold')
text(5.75,4.25,'8) 4 OF A KIND','FontSize', 18, 'FontWeight', 'bold')
text(5.75,3.5,'9) FULL HOUSE','FontSize', 18, 'FontWeight', 'bold')
text(5.75,2.75,'10) SM STRAIGHT','FontSize', 18, 'FontWeight', 'bold')
text(5.75,2,'11) LG STRAIGHT','FontSize', 18, 'FontWeight', 'bold')
text(5.75,1.25,'12) YAHTZEE','FontSize', 18, 'FontWeight', 'bold')
text(5.75,0.5,'13) CHANCE','FontSize', 18, 'FontWeight', 'bold')

rectangle('Position', [7.85 4.8 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 4.05 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 3.3 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 2.55 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 1.8 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 1.05 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [7.85 0.3 0.4 0.4], 'FaceColor', 'w', 'LineWidth', 2)

text(8.7,5,'TOTAL UPPER','FontSize', 18, 'FontWeight', 'bold')
text(8.7,3.5,'TOTAL LOWER','FontSize', 18, 'FontWeight', 'bold')
text(8.7,2,'GRAND TOTAL','FontSize', 18, 'FontWeight', 'bold')
rectangle('Position', [8.75 4.05 1.5 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [8.75 2.55 1.5 0.4], 'FaceColor', 'w', 'LineWidth', 2)
rectangle('Position', [8.75 1.05 1.5 0.4], 'FaceColor', 'w', 'LineWidth', 2)

hold on

%% PLAY GAME
taken = zeros(1, 13);
cardpoints = zeros(1, 13);
turns = 0;
already = 0;
already1 = 0;

while turns < 13
    rectangle('Position', [2.5 5.5 8 2], 'FaceColor', color, 'LineWidth', 5)
    for k = 1:1:5
        t = sprintf('%i',k);
        xpos = 1.5*k + 1.95;
        text(xpos,5.75,t,'FontSize', 18, 'FontWeight', 'bold')
        hold on
    end
    %% ROLL 1
    held = [];
    
    D1 = randi([1 6], 1, 5);
    Current_Roll = D1;
    % check %
    diceroll(D1, held)
    sound(data,fs);
    
    num_hold = input('Enter Amount of Dice to Hold:\n');
    while num_hold > 5 || num_hold < 0
        num_hold = input('Try Again. Enter Amount of Dice to Hold:\n');
    end
    for ii = 1:1:num_hold
        held(ii) = input('Enter Which Dice to Hold:\n');
        while held(ii) > 5 || held(ii) < 1
            held(ii) = input('Try Again. Enter Which Dice to Hold:\n');
        end
        rectangle('Position', [x_out(held(ii)) y_out(held(ii)) 1.12 1.12], 'EdgeColor', 'y', 'LineWidth', 5)
        text(1.5*(held(ii)) + 1.7,7.25,'HOLD','FontSize', 18, 'FontWeight', 'bold', 'Color', 'y')
        hold on
    end
    
    Current_Roll = zeros(1,numel(held));
    for k = 1:1:numel(held)
        Current_Roll(k) = D1(held(k));
    end
    
    %% ROLL 2
    rolling = randi([1 6], 1, 5);
    for k = 1:1:numel(held)
        rolling(held(k)) = 0;
    end
    D2 = rolling;
    D2(D2 == 0) = [];
    Current_Roll = [Current_Roll D2];
    % check %
    diceroll(D2, held)
    sound(data,fs);
    
    hold on
    
    held2 = [];
    
    num_hold = input('Enter Amount of Dice to Hold/Unhold:\n');
    while num_hold > 5 || num_hold < 0
        num_hold = input('Try Again. Enter Amount of Dice to Hold:\n');
    end
    
    for ii = 1:1:num_hold
        held2(ii) = input('Enter Which Dice to Hold/Unhold:\n');
        while held2(ii) > 5 || held2(ii) < 1
            held2(ii) = input('Try Again. Enter Which Dice to Hold:\n');
        end
        rectangle('Position', [x_out(held2(ii)) y_out(held2(ii)) 1.12 1.12], 'EdgeColor', 'y', 'LineWidth', 5)
        text(1.5*(held2(ii)) + 1.7,7.25,'HOLD','FontSize', 18, 'FontWeight', 'bold', 'Color', 'y')
        hold on
        for k = 1:1:numel(held)
            if held2(ii) == held(k)
                rectangle('Position', [x_out(held2(ii)) y_out(held2(ii)) 1.12 1.12], 'EdgeColor', color, 'LineWidth', 5)
                rectangle('Position', [x_out(held2(ii)) y_out(held2(ii))+1.1 1.1 0.4], 'FaceColor', color, 'EdgeColor', 'r')
                text(1.5*(held2(ii)) + 1.7,7.25,'HOLD','FontSize', 18, 'FontWeight', 'bold', 'Color', 'r')
            end
        end
    end
    
    newheld = [held held2];
    
    a = numel(held);
    b = numel(held2);
    
    for k = 1:1:a
        for j = 1:1:b
            if held(k) == held2(j)
                unhold = held(k);
                newheld(newheld == unhold) = 0;
            end
        end
    end
    
    newheld(newheld == 0) = [];
    
    Current_Roll = zeros(1,numel(newheld));
    for k = 1:1:numel(newheld)
        if ismember(newheld(k),held) == 1
            Current_Roll(k) = D1(newheld(k));
        else
            Current_Roll(k) = rolling(newheld(k));
        end
    end
    
    %% ROLL 3
    D3 = randi([1 6], 1, 5 - numel(newheld));
    Current_Roll = [Current_Roll D3];
    Current_Roll = sort(Current_Roll);
    % check %
    diceroll(D3, newheld)
    sound(data,fs);
    hold on
    
    choice = input('Choose Where to Score:\n');
    while ismember(choice,taken) == 1 || choice > 13 || choice < 1
        choice = input('Score Taken. Choose another score:\n');
    end
    points = CheckScore(Current_Roll, choice);
    taken(turns+1) = choice;
    cardpoints(choice) = points;
    if ismember(1,taken) && ismember(2,taken) && ismember(3,taken) && ismember(4,taken) && ismember(5,taken) && ismember(6,taken) && already == 0
        tot_up = cardpoints(1) + cardpoints(2) + cardpoints(3) + cardpoints(4) + cardpoints(5) + cardpoints(6);
        if tot_up >= 63
            tot_up = tot_up + 35;
            bonus = '35';
        else
            bonus = '0';
        end
        t = sprintf('%i', tot_up);
        text(4.95,0.5,bonus,'FontSize', 18, 'FontWeight', 'bold')        
        text(8.85,4.25,t,'FontSize', 18, 'FontWeight', 'bold')
        already = 1;
    end
    if ismember(7,taken) && ismember(8,taken) && ismember(9,taken) && ismember(10,taken) && ismember(11,taken) && ismember(12,taken) && ismember(13,taken) && already1 == 0
        tot_low = cardpoints(7) + cardpoints(8) + cardpoints(9) + cardpoints(10) + cardpoints(11) + cardpoints(12) + cardpoints(13);
        t = sprintf('%i', tot_low);
        text(8.85,2.75,t,'FontSize', 18, 'FontWeight', 'bold')
        already1 = 1;
    end
        turns = turns + 1;

end

%% GRAND TOTAL
grand_total = tot_up + tot_low;
t = sprintf('%i', grand_total);
text(8.85,1.25,t,'FontSize', 18, 'FontWeight', 'bold')




