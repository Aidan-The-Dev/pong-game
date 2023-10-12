SCREEN 12
WIDTH 640, 480

REM Paddle variables
DIM SHARED paddleX, paddleY, paddleHeight
paddleX = 20
paddleY = 200
paddleHeight = 80

REM Ball variables
DIM SHARED ballX, ballY, ballSpeedX, ballSpeedY
ballX = 320
ballY = 240
ballSpeedX = 3
ballSpeedY = 3

DO
    CLS

    ' Draw paddles
    LINE (paddleX, paddleY)-(paddleX + 10, paddleY + paddleHeight), 15, BF

    ' Draw ball
    CIRCLE (ballX, ballY), 10, 15, , , 1

    ' Move the ball
    ballX = ballX + ballSpeedX
    ballY = ballY + ballSpeedY

    ' Bounce the ball off the walls
    IF ballY <= 0 OR ballY >= 480 THEN ballSpeedY = -ballSpeedY
    IF ballX <= 0 THEN ballSpeedX = -ballSpeedX

    ' Check collision with paddle
    IF ballX >= paddleX AND ballX <= paddleX + 10 AND ballY >= paddleY AND ballY <= paddleY + paddleHeight THEN
        ballSpeedX = -ballSpeedX
    END IF

    ' Move the paddle
    IF INKEY$ = "w" AND paddleY > 0 THEN paddleY = paddleY - 5
    IF INKEY$ = "s" AND paddleY + paddleHeight < 480 THEN paddleY = paddleY + 5

    SLEEP 10
LOOP UNTIL INKEY$ = CHR$(27)
