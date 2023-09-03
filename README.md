# Test Threading
[![Build Status](https://github.com/gcarreno/TestThreading/actions/workflows/main.lazarus.yml/badge.svg?branch=main)](https://github.com/gcarreno/TestThreading/actions)
[![Supports Windows](https://img.shields.io/badge/support-Windows-blue?logo=Windows)](https://github.com/gcarreno/TestThreading/releases/latest)
[![Supports Linux](https://img.shields.io/badge/support-Linux-yellow?logo=Linux)](https://github.com/gcarreno/TestThreading/releases/latest)
[![Supports macOS](https://img.shields.io/badge/support-macOS-black?logo=macOS)](https://github.com/gcarreno/TestThreading/releases/latest)
[![License](https://img.shields.io/github/license/gcarreno/TestThreading)](https://github.com/gcarreno/TestThreading/blob/master/LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/gcarreno/TestThreading?label=latest%20release)](https://github.com/gcarreno/TestThreading/releases/latest)
[![Downloads](https://img.shields.io/github/downloads/gcarreno/TestThreading/total)](https://github.com/gcarreno/TestThreading/releases)

Example of how to use the Class `TThread` and all of the threading tools available with Free Pascal.

## Single Thread, Single Instance

This exemplifies the most basic use of a thread.

It declares an event to hook into the main form.

This is a single shot use because we set the thread's `FreeOnTerminate` property to True.

## Single Thread, Many Instances

The example above isn't of much use if we just run a single instance.

In this example we create multiple instances of the same thread and we start them concurrently.

This is, **also**, a single shot use because we set the thread's `FreeOnTerminate` property to True.
