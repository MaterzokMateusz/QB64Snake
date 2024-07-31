Randomize Timer
Screen _NewImage(1200, 720, 32)
Dim Shared SnakeSprites(4) As Long
Dim Shared SnakeSegments(20, 1) As Integer
Dim Shared FruitLocation(1, 1)
HeadDirection = 0
SegmentsCount = 0
game = 1
eaten = 1

SnakeSegments(0, 0) = 540
SnakeSegments(0, 1) = 300


SnakeSprites(0) = _LoadImage("SHDOWN.png")
SnakeSprites(1) = _LoadImage("SHUP.png")
SnakeSprites(2) = _LoadImage("SHLEFT.png")
SnakeSprites(3) = _LoadImage("SHRIGHT.png")
SnakeSprites(4) = _LoadImage("SSegment.png")
FruitSprite& = _LoadImage("Fruit.png")

While game = 1
    Call DrawSnake(HeadDirection, SegmentsCount)
    Call DrawFruitLocation(eaten, SegmentsCount)
    Call DrawFruit(FruitSprite&)
    Call MoveSnake(HeadDirection, SegmentsCount)
    Call Delay(1)
    Cls
Wend

Sub Delay (dlay!)

    start! = Timer
    Do While start! + dlay! >= Timer
    Loop

End Sub

Sub DrawSnake (Direction, SegmentsCount)

    _PutImage (SnakeSegments(0, 0), SnakeSegments(0, 1)), SnakeSprites(Direction)
    For x = 1 To SegmentsCount
        _PutImage (SnakeSegments(x, 0), SnakeSegments(x, 1)), SnakeSprites(4)
    Next x
End Sub

Sub DrawFruitLocation (Eaten, SegmentsCount)
    If Eaten = 1 Then

        FruitLocation(0, 0) = Int(Rnd * 1140)
        FruitLocation(0, 1) = Int(Rnd * 660)

        If FruitLocation(0, 0) Mod 60 <> 0 Then

            modulo = FruitLocation(0, 0) Mod 60
            FruitLocation(0, 0) = FruitLocation(0, 0) - modulo

        End If

        If FruitLocation(0, 1) Mod 60 <> 0 Then

            modulo = FruitLocation(0, 1) Mod 60
            FruitLocation(0, 1) = FruitLocation(0, 1) - modulo

        End If

        For x = 0 To SegmentsCount

            If FruitLocation(0, 0) = SnakeSegments(x, 0) And FruitLocation(0, 1) = SnakeSegments(x, 1) Then

                Call DrawFruitLocation(Eaten, SegmentsCount)

            End If

        Next x
        Eaten = 0
    End If

End Sub

Sub DrawFruit (FruitSprite&)

    _PutImage (FruitLocation(0, 0), FruitLocation(0, 1)), FruitSprite&

End Sub

Sub MoveSnake (HeadDirection, SegmentsCount)

    Select Case HeadDirection

        Case 0
            For x = 0 To SegmentsCount

                tempY = SnakeSegments(x, 1)
                SnakeSegments(x, 1) = SnakeSegments(x, 1) + 60
                SnakeSegments(x + 1, 1) = tempY

            Next x
        Case 1
            For x = 0 To SegmentsCount

                tempY = SnakeSegments(x, 1)
                SnakeSegments(x, 1) = SnakeSegments(x, 1) - 60
                SnakeSegments(x + 1, 1) = tempY

            Next x
        Case 2
            For x = 0 To SegmentsCount

                tempX = SnakeSegments(x, 0)
                SnakeSegments(x, 0) = SnakeSegments(x, 0) - 60
                SnakeSegments(x + 1, 0) = tempX

            Next x
        Case 3
            For x = 0 To SegmentsCount

                tempX = SnakeSegments(x, 0)
                SnakeSegments(x, 0) = SnakeSegments(x, 0) + 60
                SnakeSegments(x + 1, 0) = tempX

            Next x

    End Select

End Sub
