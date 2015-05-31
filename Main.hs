{-# LANGUAGE GADTs #-}
module Main where

class Drawable shape where
  draw :: shape -> String

type Coord = (Int,Int)
showCoord :: Coord -> String
showCoord (x,y) = "{x:" ++ show x ++ ",y:" ++ show y ++ "}"

class Locatable shape where
  coords :: shape -> Coord
  move :: Coord -> shape -> shape

data Shape where
  Shape :: (Locatable shape, Drawable shape) => shape -> Shape

instance Drawable Shape where
  draw (Shape a) = draw a

instance Locatable Shape where
  coords (Shape a) = coords a
  move cs (Shape a) = Shape $ move cs a

data Rect = Rect {rectCoord::Coord}
data Circle = Circle {circleCoord::Coord}

instance Drawable Rect where
  draw (Rect cs) = "Rect" ++ showCoord cs

instance Locatable Rect where
  coords = rectCoord
  move cs _ = Rect cs

instance Drawable Circle where
  draw (Circle cs) = "Circ" ++ showCoord cs

instance Locatable Circle where
  coords = circleCoord
  move cs _ = Circle cs

newRect :: Rect
newRect = Rect (0,0)

newCircle :: Circle
newCircle = Circle (0,0)

process :: [Shape] -> IO ()
process = process' . zipWith move increasingCoords . (Shape newRect:)
  where
    process' :: [Shape] -> IO ()
    process' = mapM_ (putStrLn . draw)
    increasingCoords :: [Coord]
    increasingCoords = zip [1..] [1..]

main :: IO ()
main = process [Shape newRect, Shape newCircle, Shape newRect]

