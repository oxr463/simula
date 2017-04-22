module Simula.NewCompositor.Compositor where

import Data.IORef
import Foreign

import Simula.Wayland

import Simula.NewCompositor.SceneGraph
import Simula.NewCompositor.OpenGL
import Simula.NewCompositor.Types
import Simula.NewCompositor.Wayland.Input
import Simula.NewCompositor.Wayland.Output


data CompositorType = QtWayland | OsvrQtWayland

class Compositor a where
  startCompositor :: a -> IO ()

  compositorOpenGLContext :: a -> IO (Some OpenGLContext)
  compositorSeat :: a -> IO (Some Seat)

  compositorDisplay :: a -> IO Display
  setCompositorDisplay :: a -> Display -> IO ()

  compositorWlDisplay :: a -> Ptr C'wl_display

  compositorGetSurfaceFromResource :: a -> Ptr C'wl_resource -> IO (Some WaylandSurface)
