classdef app1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure              matlab.ui.Figure
        Button                matlab.ui.control.Button
        Button_2              matlab.ui.control.Button
        Button_3              matlab.ui.control.Button
        AButton               matlab.ui.control.Button
        Button_4              matlab.ui.control.Button
        Button_5              matlab.ui.control.Button
        Button_6              matlab.ui.control.Button
        BButton               matlab.ui.control.Button
        Button_7              matlab.ui.control.Button
        Button_8              matlab.ui.control.Button
        Button_9              matlab.ui.control.Button
        CButton               matlab.ui.control.Button
        Button_10             matlab.ui.control.Button
        Button_11             matlab.ui.control.Button
        Button_12             matlab.ui.control.Button
        DButton               matlab.ui.control.Button
        Button_13             matlab.ui.control.StateButton
        PressanykeyLabel      matlab.ui.control.Label
        ThePressedkeyisLabel  matlab.ui.control.Label
    end

    

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'UI Figure';

            % Create Button
            app.Button = uibutton(app.UIFigure, 'push');
            app.Button.Position = [63 408 100 22];
            app.Button.Text = '1';

            % Create Button_2
            app.Button_2 = uibutton(app.UIFigure, 'push');
            app.Button_2.Position = [162 408 100 22];
            app.Button_2.Text = '2';

            % Create Button_3
            app.Button_3 = uibutton(app.UIFigure, 'push');
            app.Button_3.Position = [261 408 100 22];
            app.Button_3.Text = '3';

            % Create AButton
            app.AButton = uibutton(app.UIFigure, 'push');
            app.AButton.Position = [360 408 100 22];
            app.AButton.Text = 'A';

            % Create Button_4
            app.Button_4 = uibutton(app.UIFigure, 'push');
            app.Button_4.Position = [63 387 100 22];
            app.Button_4.Text = '4';

            % Create Button_5
            app.Button_5 = uibutton(app.UIFigure, 'push');
            app.Button_5.Position = [162 387 100 22];
            app.Button_5.Text = '5';

            % Create Button_6
            app.Button_6 = uibutton(app.UIFigure, 'push');
            app.Button_6.Position = [261 387 100 22];
            app.Button_6.Text = '6';

            % Create BButton
            app.BButton = uibutton(app.UIFigure, 'push');
            app.BButton.Position = [360 387 100 22];
            app.BButton.Text = 'B';

            % Create Button_7
            app.Button_7 = uibutton(app.UIFigure, 'push');
            app.Button_7.Position = [63 366 100 22];
            app.Button_7.Text = '7';

            % Create Button_8
            app.Button_8 = uibutton(app.UIFigure, 'push');
            app.Button_8.Position = [162 366 100 22];
            app.Button_8.Text = '8';

            % Create Button_9
            app.Button_9 = uibutton(app.UIFigure, 'push');
            app.Button_9.Position = [261 366 100 22];
            app.Button_9.Text = '9';

            % Create CButton
            app.CButton = uibutton(app.UIFigure, 'push');
            app.CButton.Position = [360 366 100 22];
            app.CButton.Text = 'C';

            % Create Button_10
            app.Button_10 = uibutton(app.UIFigure, 'push');
            app.Button_10.Position = [63 345 100 22];
            app.Button_10.Text = '*';

            % Create Button_11
            app.Button_11 = uibutton(app.UIFigure, 'push');
            app.Button_11.Position = [162 345 100 22];
            app.Button_11.Text = '0';

            % Create Button_12
            app.Button_12 = uibutton(app.UIFigure, 'push');
            app.Button_12.Position = [261 345 100 22];
            app.Button_12.Text = '#';

            % Create DButton
            app.DButton = uibutton(app.UIFigure, 'push');
            app.DButton.Position = [360 345 100 22];
            app.DButton.Text = 'D';

            % Create Button_13
            app.Button_13 = uibutton(app.UIFigure, 'state');
            app.Button_13.Text = '7';
            app.Button_13.Position = [215 252 100 22];

            % Create PressanykeyLabel
            app.PressanykeyLabel = uilabel(app.UIFigure);
            app.PressanykeyLabel.HorizontalAlignment = 'center';
            app.PressanykeyLabel.Position = [224 429 81 22];
            app.PressanykeyLabel.Text = 'Press any key';

            % Create ThePressedkeyisLabel
            app.ThePressedkeyisLabel = uilabel(app.UIFigure);
            app.ThePressedkeyisLabel.HorizontalAlignment = 'center';
            app.ThePressedkeyisLabel.Position = [210 273 111 22];
            app.ThePressedkeyisLabel.Text = 'The Pressed key is:';
        end
    end

    methods (Access = public)

        % Construct app
        function app = app1

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end