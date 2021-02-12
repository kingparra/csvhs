{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_csvhs (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/bin"
libdir     = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/lib/x86_64-linux-ghc-8.8.4/csvhs-0.0.0-2pIvZ6tDiQu8FR8epfVSPj"
dynlibdir  = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/share/x86_64-linux-ghc-8.8.4/csvhs-0.0.0"
libexecdir = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/libexec/x86_64-linux-ghc-8.8.4/csvhs-0.0.0"
sysconfdir = "/home/chris/Projects/csvhs/.stack-work/install/x86_64-linux-tinfo6/7ecba9eb4b405b4684d15cac219e5327661ff84ee6654d22d73a7dff805e733c/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "csvhs_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "csvhs_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "csvhs_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "csvhs_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "csvhs_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "csvhs_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
