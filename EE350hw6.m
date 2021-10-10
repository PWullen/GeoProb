%Geometric distribution
%%Write a function to generate samples of X.
function EE350hw6(s) %s = samples of experiment
    n = 15; %basketball team players
    ProbP = 0.5; %star player always shooting first 
    arrayProbP = ProbP*randi(2,1,s) > 0.5; %logical array based on ProbP
    disp("'Prob Ability' boolean success over s samples");
    disp(arrayProbP);
    for i = 1:s %iterator for function
        if arrayProbP(i) == 1
            disp("Sample number = ");
            disp(i);
            ProbTeamP = 0.8; %arrayProbP(i)
%             disp("'Prob Ability' made his basket"); %self check
            arrayTeamP = round(ProbTeamP*randi(2,1,n-1))-1; %-1 at end to offset rounding
%             disp("The team's made/missed shots as Boolean ="); %self check
%             disp(arrayTeamP);
            totalX = sum(arrayTeamP >= 1)+1; %add 1 to account for first player
            disp("The teams total made shots =");
            disp(totalX); %part (a) in hw 
            %for part (b) we need to estimate P_X(x)for each x in the range of X.  
            %via counting the number of samples when the event occurs and dividing
            %by the total number of samples.
            PXx = totalX/n;
            disp("The estimated P_X(x) = ");
            disp(PXx);
            %now we need the conditional probability mass function P_(X|B)(x) 
            %where B = {X>=10}
            B = totalX >= 10;
            disp("Boolean check for event B");
            disp(B);
            PBx = B/n;
            disp("The estimated P_B(x) = ");
            disp(PBx);
            conditionalPXB = PXx*PBx;
            disp("The conditional probability of X given B =");
            disp(conditionalPXB);
        else
            disp("Sample number = ");
            disp(i);
            ProbTeamP = 0.2;
%             disp("'Prob Ability' missed his basket"); %self check
            arrayTeamP = round(ProbTeamP*randi(2,1,n-1));
%             disp("The team's made/missed shots as Boolean ="); %self check
%             disp(arrayTeamP);
            totalX = sum(arrayTeamP >= 1);
            disp("The teams total made shots =");
            disp(totalX); %part (a) in hw    
            %for part (b) we need to estimate P_X(x)for each x in the range of X.  
            %via counting the number of samples when the event occurs and dividing
            %by the total number of samples.
            PXx = totalX/n;
            disp("The estimated P_X(x) = ");
            disp(PXx);
            B = totalX >= 10;
            disp("Boolean check for event B");
            disp(B);
            %now we need the conditional probability mass function P_(X|B)(x) 
            %where B = {X>=10}
            PBx = B/s;
            disp("The estimated P_B(x) = ");
            disp(PBx);
            conditionalPXB = PXx*PBx;
            disp("The conditional probability of X given B =");
            disp(conditionalPXB);
        end
    end       
end
