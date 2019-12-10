from enum import IntEnum

import cython
from libc.stdint cimport uint32_t
from libcpp.vector cimport vector

from .kaacore.engine cimport CEngine, get_c_engine
from .kaacore.input cimport (
    CKeycode, CMouseButton, CControllerButton, CControllerAxis,
    CCompoundControllerAxis, CCompoundEventType, CEventType, CWindowEventType,
    CSystemEvent, CWindowEvent, CKeyboardEvent, CMouseEvent,
    CControllerEvent, CAudioEvent, CEvent, CInputManager, CSystemManager,
    CKeyboardManager, CMouseManager, CControllerManager, CControllerID
)


DEF EVENT_FREELIST_SIZE = 10


class Keycode(IntEnum):
    unknown = <uint32_t>CKeycode.k_unknown
    return_ = <uint32_t>CKeycode.k_return
    escape = <uint32_t>CKeycode.k_escape
    backspace = <uint32_t>CKeycode.k_backspace
    tab = <uint32_t>CKeycode.k_tab
    space = <uint32_t>CKeycode.k_space
    exclaim = <uint32_t>CKeycode.k_exclaim
    quotedbl = <uint32_t>CKeycode.k_quotedbl
    hash = <uint32_t>CKeycode.k_hash
    percent = <uint32_t>CKeycode.k_percent
    dollar = <uint32_t>CKeycode.k_dollar
    ampersand = <uint32_t>CKeycode.k_ampersand
    quote = <uint32_t>CKeycode.k_quote
    leftparen = <uint32_t>CKeycode.k_leftparen
    rightparen = <uint32_t>CKeycode.k_rightparen
    asterisk = <uint32_t>CKeycode.k_asterisk
    plus = <uint32_t>CKeycode.k_plus
    comma = <uint32_t>CKeycode.k_comma
    minus = <uint32_t>CKeycode.k_minus
    period = <uint32_t>CKeycode.k_period
    slash = <uint32_t>CKeycode.k_slash
    num_0 = <uint32_t>CKeycode.k_num_0
    num_1 = <uint32_t>CKeycode.k_num_1
    num_2 = <uint32_t>CKeycode.k_num_2
    num_3 = <uint32_t>CKeycode.k_num_3
    num_4 = <uint32_t>CKeycode.k_num_4
    num_5 = <uint32_t>CKeycode.k_num_5
    num_6 = <uint32_t>CKeycode.k_num_6
    num_7 = <uint32_t>CKeycode.k_num_7
    num_8 = <uint32_t>CKeycode.k_num_8
    num_9 = <uint32_t>CKeycode.k_num_9
    colon = <uint32_t>CKeycode.k_colon
    semicolon = <uint32_t>CKeycode.k_semicolon
    less = <uint32_t>CKeycode.k_less
    equals = <uint32_t>CKeycode.k_equals
    greater = <uint32_t>CKeycode.k_greater
    question = <uint32_t>CKeycode.k_question
    at = <uint32_t>CKeycode.k_at
    leftbracket = <uint32_t>CKeycode.k_leftbracket
    backslash = <uint32_t>CKeycode.k_backslash
    rightbracket = <uint32_t>CKeycode.k_rightbracket
    caret = <uint32_t>CKeycode.k_caret
    underscore = <uint32_t>CKeycode.k_underscore
    backquote = <uint32_t>CKeycode.k_backquote
    a = <uint32_t>CKeycode.k_a
    b = <uint32_t>CKeycode.k_b
    c = <uint32_t>CKeycode.k_c
    d = <uint32_t>CKeycode.k_d
    e = <uint32_t>CKeycode.k_e
    f = <uint32_t>CKeycode.k_f
    g = <uint32_t>CKeycode.k_g
    h = <uint32_t>CKeycode.k_h
    i = <uint32_t>CKeycode.k_i
    j = <uint32_t>CKeycode.k_j
    k = <uint32_t>CKeycode.k_k
    l = <uint32_t>CKeycode.k_l
    m = <uint32_t>CKeycode.k_m
    n = <uint32_t>CKeycode.k_n
    o = <uint32_t>CKeycode.k_o
    p = <uint32_t>CKeycode.k_p
    q = <uint32_t>CKeycode.k_q
    r = <uint32_t>CKeycode.k_r
    s = <uint32_t>CKeycode.k_s
    t = <uint32_t>CKeycode.k_t
    u = <uint32_t>CKeycode.k_u
    v = <uint32_t>CKeycode.k_v
    w = <uint32_t>CKeycode.k_w
    x = <uint32_t>CKeycode.k_x
    y = <uint32_t>CKeycode.k_y
    z = <uint32_t>CKeycode.k_z
    A = <uint32_t>CKeycode.k_A
    B = <uint32_t>CKeycode.k_B
    C = <uint32_t>CKeycode.k_C
    D = <uint32_t>CKeycode.k_D
    E = <uint32_t>CKeycode.k_E
    F = <uint32_t>CKeycode.k_F
    G = <uint32_t>CKeycode.k_G
    H = <uint32_t>CKeycode.k_H
    I = <uint32_t>CKeycode.k_I
    J = <uint32_t>CKeycode.k_J
    K = <uint32_t>CKeycode.k_K
    L = <uint32_t>CKeycode.k_L
    M = <uint32_t>CKeycode.k_M
    N = <uint32_t>CKeycode.k_N
    O = <uint32_t>CKeycode.k_O
    P = <uint32_t>CKeycode.k_P
    Q = <uint32_t>CKeycode.k_Q
    R = <uint32_t>CKeycode.k_R
    S = <uint32_t>CKeycode.k_S
    T = <uint32_t>CKeycode.k_T
    U = <uint32_t>CKeycode.k_U
    V = <uint32_t>CKeycode.k_V
    W = <uint32_t>CKeycode.k_W
    X = <uint32_t>CKeycode.k_X
    Y = <uint32_t>CKeycode.k_Y
    Z = <uint32_t>CKeycode.k_Z
    capslock = <uint32_t>CKeycode.k_capslock
    F1 = <uint32_t>CKeycode.k_F1
    F2 = <uint32_t>CKeycode.k_F2
    F3 = <uint32_t>CKeycode.k_F3
    F4 = <uint32_t>CKeycode.k_F4
    F5 = <uint32_t>CKeycode.k_F5
    F6 = <uint32_t>CKeycode.k_F6
    F7 = <uint32_t>CKeycode.k_F7
    F8 = <uint32_t>CKeycode.k_F8
    F9 = <uint32_t>CKeycode.k_F9
    F10 = <uint32_t>CKeycode.k_F10
    F11 = <uint32_t>CKeycode.k_F11
    F12 = <uint32_t>CKeycode.k_F12
    printscreen = <uint32_t>CKeycode.k_printscreen
    scrolllock = <uint32_t>CKeycode.k_scrolllock
    pause = <uint32_t>CKeycode.k_pause
    insert = <uint32_t>CKeycode.k_insert
    home = <uint32_t>CKeycode.k_home
    pageup = <uint32_t>CKeycode.k_pageup
    delete = <uint32_t>CKeycode.k_delete
    end = <uint32_t>CKeycode.k_end
    pagedown = <uint32_t>CKeycode.k_pagedown
    right = <uint32_t>CKeycode.k_right
    left = <uint32_t>CKeycode.k_left
    down = <uint32_t>CKeycode.k_down
    up = <uint32_t>CKeycode.k_up
    numlockclear = <uint32_t>CKeycode.k_numlockclear
    kp_divide = <uint32_t>CKeycode.k_kp_divide
    kp_multiply = <uint32_t>CKeycode.k_kp_multiply
    kp_minus = <uint32_t>CKeycode.k_kp_minus
    kp_plus = <uint32_t>CKeycode.k_kp_plus
    kp_enter = <uint32_t>CKeycode.k_kp_enter
    kp_1 = <uint32_t>CKeycode.k_kp_1
    kp_2 = <uint32_t>CKeycode.k_kp_2
    kp_3 = <uint32_t>CKeycode.k_kp_3
    kp_4 = <uint32_t>CKeycode.k_kp_4
    kp_5 = <uint32_t>CKeycode.k_kp_5
    kp_6 = <uint32_t>CKeycode.k_kp_6
    kp_7 = <uint32_t>CKeycode.k_kp_7
    kp_8 = <uint32_t>CKeycode.k_kp_8
    kp_9 = <uint32_t>CKeycode.k_kp_9
    kp_0 = <uint32_t>CKeycode.k_kp_0
    kp_period = <uint32_t>CKeycode.k_kp_period
    application = <uint32_t>CKeycode.k_application
    power = <uint32_t>CKeycode.k_power
    kp_equals = <uint32_t>CKeycode.k_kp_equals
    F13 = <uint32_t>CKeycode.k_F13
    F14 = <uint32_t>CKeycode.k_F14
    F15 = <uint32_t>CKeycode.k_F15
    F16 = <uint32_t>CKeycode.k_F16
    F17 = <uint32_t>CKeycode.k_F17
    F18 = <uint32_t>CKeycode.k_F18
    F19 = <uint32_t>CKeycode.k_F19
    F20 = <uint32_t>CKeycode.k_F20
    F21 = <uint32_t>CKeycode.k_F21
    F22 = <uint32_t>CKeycode.k_F22
    F23 = <uint32_t>CKeycode.k_F23
    F24 = <uint32_t>CKeycode.k_F24
    execute = <uint32_t>CKeycode.k_execute
    help = <uint32_t>CKeycode.k_help
    menu = <uint32_t>CKeycode.k_menu
    select = <uint32_t>CKeycode.k_select
    stop = <uint32_t>CKeycode.k_stop
    again = <uint32_t>CKeycode.k_again
    undo = <uint32_t>CKeycode.k_undo
    cut = <uint32_t>CKeycode.k_cut
    copy = <uint32_t>CKeycode.k_copy
    paste = <uint32_t>CKeycode.k_paste
    find = <uint32_t>CKeycode.k_find
    mute = <uint32_t>CKeycode.k_mute
    volumeup = <uint32_t>CKeycode.k_volumeup
    volumedown = <uint32_t>CKeycode.k_volumedown
    kp_comma = <uint32_t>CKeycode.k_kp_comma
    kp_equalsas400 = <uint32_t>CKeycode.k_kp_equalsas400
    alterase = <uint32_t>CKeycode.k_alterase
    sysreq = <uint32_t>CKeycode.k_sysreq
    cancel = <uint32_t>CKeycode.k_cancel
    clear = <uint32_t>CKeycode.k_clear
    prior = <uint32_t>CKeycode.k_prior
    return2 = <uint32_t>CKeycode.k_return2
    separator = <uint32_t>CKeycode.k_separator
    out = <uint32_t>CKeycode.k_out
    oper = <uint32_t>CKeycode.k_oper
    clearagain = <uint32_t>CKeycode.k_clearagain
    crsel = <uint32_t>CKeycode.k_crsel
    exsel = <uint32_t>CKeycode.k_exsel
    kp_00 = <uint32_t>CKeycode.k_kp_00
    kp_000 = <uint32_t>CKeycode.k_kp_000
    thousandsseparator = <uint32_t>CKeycode.k_thousandsseparator
    decimalseparator = <uint32_t>CKeycode.k_decimalseparator
    currencyunit = <uint32_t>CKeycode.k_currencyunit
    currencysubunit = <uint32_t>CKeycode.k_currencysubunit
    kp_leftparen = <uint32_t>CKeycode.k_kp_leftparen
    kp_rightparen = <uint32_t>CKeycode.k_kp_rightparen
    kp_leftbrace = <uint32_t>CKeycode.k_kp_leftbrace
    kp_rightbrace = <uint32_t>CKeycode.k_kp_rightbrace
    kp_tab = <uint32_t>CKeycode.k_kp_tab
    kp_backspace = <uint32_t>CKeycode.k_kp_backspace
    kp_a = <uint32_t>CKeycode.k_kp_a
    kp_b = <uint32_t>CKeycode.k_kp_b
    kp_c = <uint32_t>CKeycode.k_kp_c
    kp_d = <uint32_t>CKeycode.k_kp_d
    kp_e = <uint32_t>CKeycode.k_kp_e
    kp_f = <uint32_t>CKeycode.k_kp_f
    kp_xor = <uint32_t>CKeycode.k_kp_xor
    kp_power = <uint32_t>CKeycode.k_kp_power
    kp_percent = <uint32_t>CKeycode.k_kp_percent
    kp_less = <uint32_t>CKeycode.k_kp_less
    kp_greater = <uint32_t>CKeycode.k_kp_greater
    kp_ampersand = <uint32_t>CKeycode.k_kp_ampersand
    kp_dblampersand = <uint32_t>CKeycode.k_kp_dblampersand
    kp_verticalbar = <uint32_t>CKeycode.k_kp_verticalbar
    kp_dblverticalbar = <uint32_t>CKeycode.k_kp_dblverticalbar
    kp_colon = <uint32_t>CKeycode.k_kp_colon
    kp_hash = <uint32_t>CKeycode.k_kp_hash
    kp_space = <uint32_t>CKeycode.k_kp_space
    kp_at = <uint32_t>CKeycode.k_kp_at
    kp_exclam = <uint32_t>CKeycode.k_kp_exclam
    kp_memstore = <uint32_t>CKeycode.k_kp_memstore
    kp_memrecall = <uint32_t>CKeycode.k_kp_memrecall
    kp_memclear = <uint32_t>CKeycode.k_kp_memclear
    kp_memadd = <uint32_t>CKeycode.k_kp_memadd
    kp_memsubtract = <uint32_t>CKeycode.k_kp_memsubtract
    kp_memmultiply = <uint32_t>CKeycode.k_kp_memmultiply
    kp_memdivide = <uint32_t>CKeycode.k_kp_memdivide
    kp_plusminus = <uint32_t>CKeycode.k_kp_plusminus
    kp_clear = <uint32_t>CKeycode.k_kp_clear
    kp_clearentry = <uint32_t>CKeycode.k_kp_clearentry
    kp_binary = <uint32_t>CKeycode.k_kp_binary
    kp_octal = <uint32_t>CKeycode.k_kp_octal
    kp_decimal = <uint32_t>CKeycode.k_kp_decimal
    kp_hexadecimal = <uint32_t>CKeycode.k_kp_hexadecimal
    lctrl = <uint32_t>CKeycode.k_lctrl
    lshift = <uint32_t>CKeycode.k_lshift
    lalt = <uint32_t>CKeycode.k_lalt
    lgui = <uint32_t>CKeycode.k_lgui
    rctrl = <uint32_t>CKeycode.k_rctrl
    rshift = <uint32_t>CKeycode.k_rshift
    ralt = <uint32_t>CKeycode.k_ralt
    rgui = <uint32_t>CKeycode.k_rgui
    mode = <uint32_t>CKeycode.k_mode
    audionext = <uint32_t>CKeycode.k_audionext
    audioprev = <uint32_t>CKeycode.k_audioprev
    audiostop = <uint32_t>CKeycode.k_audiostop
    audioplay = <uint32_t>CKeycode.k_audioplay
    audiomute = <uint32_t>CKeycode.k_audiomute
    mediaselect = <uint32_t>CKeycode.k_mediaselect
    www = <uint32_t>CKeycode.k_www
    mail = <uint32_t>CKeycode.k_mail
    calculator = <uint32_t>CKeycode.k_calculator
    computer = <uint32_t>CKeycode.k_computer
    ac_search = <uint32_t>CKeycode.k_ac_search
    ac_home = <uint32_t>CKeycode.k_ac_home
    ac_back = <uint32_t>CKeycode.k_ac_back
    ac_forward = <uint32_t>CKeycode.k_ac_forward
    ac_stop = <uint32_t>CKeycode.k_ac_stop
    ac_refresh = <uint32_t>CKeycode.k_ac_refresh
    ac_bookmarks = <uint32_t>CKeycode.k_ac_bookmarks
    brightnessdown = <uint32_t>CKeycode.k_brightnessdown
    brightnessup = <uint32_t>CKeycode.k_brightnessup
    displayswitch = <uint32_t>CKeycode.k_displayswitch
    kbdillumtoggle = <uint32_t>CKeycode.k_kbdillumtoggle
    kbdillumdown = <uint32_t>CKeycode.k_kbdillumdown
    kbdillumup = <uint32_t>CKeycode.k_kbdillumup
    eject = <uint32_t>CKeycode.k_eject
    sleep = <uint32_t>CKeycode.k_sleep


class MouseButton(IntEnum):
    left = <uint32_t>CMouseButton.m_left
    middle = <uint32_t>CMouseButton.m_middle
    right = <uint32_t>CMouseButton.m_right
    x1 = <uint32_t>CMouseButton.m_x1
    x2 = <uint32_t>CMouseButton.m_x2


class ControllerButton(IntEnum):
    a = <uint32_t>CControllerButton.c_a
    b = <uint32_t>CControllerButton.c_b
    x = <uint32_t>CControllerButton.c_x
    y = <uint32_t>CControllerButton.c_y
    back = <uint32_t>CControllerButton.c_back
    guide = <uint32_t>CControllerButton.c_guide
    start = <uint32_t>CControllerButton.c_start
    left_stick = <uint32_t>CControllerButton.c_left_stick
    right_stick = <uint32_t>CControllerButton.c_right_stick
    left_shoulder = <uint32_t>CControllerButton.c_left_shoulder
    right_shoulder = <uint32_t>CControllerButton.c_left_shoulder
    dpad_up = <uint32_t>CControllerButton.c_dpad_up
    dpad_down = <uint32_t>CControllerButton.c_dpad_down
    dpad_left = <uint32_t>CControllerButton.c_dpad_left
    dpad_right = <uint32_t>CControllerButton.c_dpad_right


class ControllerAxis(IntEnum):
    left_y = <uint32_t>CControllerAxis.c_left_y
    left_x = <uint32_t>CControllerAxis.c_left_x
    right_x = <uint32_t>CControllerAxis.c_right_x
    right_y = <uint32_t>CControllerAxis.c_right_y
    trigger_left = <uint32_t>CControllerAxis.c_trigger_left
    trigger_right = <uint32_t>CControllerAxis.c_trigger_right


class EventType(IntEnum):
    quit = <uint32_t>CEventType.quit
    clipboard_updated = <uint32_t>CEventType.clipboard_updated

    key_down = <uint32_t>CEventType.key_down
    key_up = <uint32_t>CEventType.key_up
    text_input = <uint32_t>CEventType.text_input

    mouse_motion = <uint32_t>CEventType.mouse_motion
    mouse_button_up = <uint32_t>CEventType.mouse_button_up
    mouse_button_down = <uint32_t>CEventType.mouse_button_down
    mouse_wheel = <uint32_t>CEventType.mouse_wheel

    controller_axis_motion = <uint32_t>CEventType.controller_axis_motion
    controller_button_down = <uint32_t>CEventType.controller_button_down
    controller_button_up = <uint32_t>CEventType.controller_button_up
    controller_added = <uint32_t>CEventType.controller_added
    controller_removed = <uint32_t>CEventType.controller_removed
    controller_remapped = <uint32_t>CEventType.controller_remapped

    music_finished = <uint32_t>CEventType.music_finished
    channel_finished = <uint32_t>CEventType.channel_finished


class WindowEventType(IntEnum):
    shown = <uint32_t>CWindowEventType.shown,
    hidden = <uint32_t>CWindowEventType.hidden,
    exposed = <uint32_t>CWindowEventType.exposed,
    moved = <uint32_t>CWindowEventType.moved,
    resized = <uint32_t>CWindowEventType.resized,
    minimized = <uint32_t>CWindowEventType.minimized,
    maximized = <uint32_t>CWindowEventType.maximized,
    restored = <uint32_t>CWindowEventType.restored,
    enter = <uint32_t>CWindowEventType.enter,
    leave = <uint32_t>CWindowEventType.leave,
    focus_gained = <uint32_t>CWindowEventType.focus_gained,
    focus_lost = <uint32_t>CWindowEventType.focus_lost,
    close = <uint32_t>CWindowEventType.close


class CompoundEventType(IntEnum):
    window = <uint32_t>CCompoundEventType.window
    system = <uint32_t>CCompoundEventType.system
    keyboard = <uint32_t>CCompoundEventType.keyboard
    mouse = <uint32_t>CCompoundEventType.mouse
    controller = <uint32_t>CCompoundEventType.controller


class CompoundControllerAxis(IntEnum):
    left_stick = <uint32_t>CCompoundControllerAxis.left_stick
    right_stick = <uint32_t>CCompoundControllerAxis.right_stick


cdef class _TypedReadOnlyProperty:
    cdef:
        object get_fun
        object event_type

    def __init__(self, event_type, get_fun):
        self.event_type = event_type
        self.get_fun = get_fun

    def __get__(self, obj, klass):
        if obj is None:
            return self.event_type
        return self.get_fun(obj)


cdef typed_property(object event_type):
    def decorator(fun):
        return _TypedReadOnlyProperty(event_type, fun)
    return decorator


@cython.freelist(EVENT_FREELIST_SIZE)
cdef class _BaseEvent:
    cdef CEvent c_event

    @property
    def timestamp(self):
        return self.c_event.timestamp()


@cython.final
cdef class SystemEvent(_BaseEvent):
    @staticmethod
    cdef SystemEvent create(CEvent c_event):
        cdef SystemEvent instance = SystemEvent.__new__(SystemEvent)
        instance.c_event = c_event
        return instance

    @typed_property(EventType.quit)
    def quit(self):
        return self.c_event.system().quit()
    
    @typed_property(EventType.clipboard_updated)
    def clipboard_updated(self):
        return self.c_event.system().clipboard_updated()


@cython.final
cdef class WindowEvent(_BaseEvent):
    @staticmethod
    cdef WindowEvent create(CEvent c_event):
        cdef WindowEvent instance = WindowEvent.__new__(WindowEvent)
        instance.c_event = c_event
        return instance

    @typed_property(WindowEventType.shown)
    def shown(self):
        return self.c_event.window().shown()
    
    @typed_property(WindowEventType.exposed)
    def exposed(self):
        return self.c_event.window().exposed()
    
    @typed_property(WindowEventType.moved)
    def moved(self):
        return self.c_event.window().moved()
    
    @typed_property(WindowEventType.resized)
    def resized(self):
        return self.c_event.window().resized()

    @typed_property(WindowEventType.minimized)
    def minimized(self):
        return self.c_event.window().minimized()

    @typed_property(WindowEventType.maximized)
    def maximized(self):
        return self.c_event.window().maximized()

    @typed_property(WindowEventType.restored)
    def restored(self):
        return self.c_event.window().restored()
    
    @typed_property(WindowEventType.enter)
    def enter(self):
        return self.c_event.window().enter()

    @typed_property(WindowEventType.leave)
    def leave(self):
        return self.c_event.window().leave()

    @typed_property(WindowEventType.focus_gained)
    def focus_gained(self):
        return self.c_event.window().focus_gained()

    @typed_property(WindowEventType.focus_lost)
    def focus_lost(self):
        return self.c_event.window().focus_lost()

    @typed_property(WindowEventType.close)
    def close(self):
        return self.c_event.window().close()

    @property
    def size(self):
        return Vector.from_c_vector(self.c_event.window().size())
    
    @property
    def position(self):
        return Vector.from_c_vector(self.c_event.window().position())
    

@cython.final
cdef class KeyboardEvent(_BaseEvent):
    @staticmethod
    cdef KeyboardEvent create(CEvent c_event):
        cdef KeyboardEvent instance = KeyboardEvent.__new__(KeyboardEvent)
        instance.c_event = c_event
        return instance

    @typed_property(EventType.text_input)
    def text_input(self):
        return self.c_event.keyboard().text_input()

    @property
    def text(self):
        return self.c_event.keyboard().text().decode('utf-8')
    
    def is_pressing(self, kc not None):
        return self.c_event.keyboard().is_pressing(
            <CKeycode>(<uint32_t>(kc.value))
        )

    def is_releasing(self, kc not None):
        return self.c_event.keyboard().is_releasing(
            <CKeycode>(<uint32_t>(kc.value))
        )


@cython.final
cdef class MouseEvent(_BaseEvent):
    @staticmethod
    cdef MouseEvent create(CEvent c_event):
        cdef MouseEvent instance = MouseEvent.__new__(MouseEvent)
        instance.c_event = c_event
        return instance
    
    @typed_property((EventType.mouse_button_down, EventType.mouse_button_up))
    def button(self):
        return self.c_event.mouse().button()

    def is_pressing(self, mb not None):
        return self.c_event.mouse().is_pressing(
            <CMouseButton>(<uint32_t>(mb.value))
        )
    
    def is_releasing(self, mb not None):
        return self.c_event.mouse().is_releasing(
            <CMouseButton>(<uint32_t>(mb.value))
        )

    @typed_property(EventType.mouse_motion)
    def motion(self):
        return self.c_event.mouse().motion()

    @property
    def position(self):
        return Vector.from_c_vector(self.c_event.mouse().position())

    @typed_property(EventType.mouse_wheel)
    def wheel(self):
        return self.c_event.mouse().wheel()

    @property
    def scroll(self):
        return Vector.from_c_vector(self.c_event.mouse().scroll())


@cython.final
cdef class ControllerEvent(_BaseEvent):
    @staticmethod
    cdef ControllerEvent create(CEvent c_event):
        cdef ControllerEvent instance = ControllerEvent.__new__(ControllerEvent)
        instance.c_event = c_event
        return instance

    @property
    def id(self):
        return self.c_event.controller().id()
    
    @typed_property((EventType.controller_button_down, EventType.controller_button_up))
    def button(self):
        return self.c_event.controller().button()

    def is_pressing(self, cb not None):
        return self.c_event.controller().is_pressing(
            <CControllerButton>(<uint32_t>(cb.value))
        )
    
    def is_releasing(self, cb not None):
        return self.c_event.controller().is_releasing(
            <CControllerButton>(<uint32_t>(cb.value))
        )

    @typed_property(EventType.controller_axis_motion)
    def axis(self):
        return self.c_event.controller().axis()

    def axis_motion(self, ca not None):
        return self.c_event.controller().axis_motion(
            <CControllerAxis>(<uint32_t>(ca.value))
        )

    @typed_property(EventType.controller_added)
    def added(self):
        return self.c_event.controller().added()

    @typed_property(EventType.controller_removed)
    def removed(self):
        return self.c_event.controller().removed()


@cython.final
cdef class AudioEvent(_BaseEvent):
    @staticmethod
    cdef AudioEvent create(CEvent c_event):
        cdef AudioEvent instance = AudioEvent.__new__(AudioEvent)
        instance.c_event = c_event
        return instance

    @typed_property(EventType.music_finished)
    def music_finished(self):
        return self.c_event.audio().music_finished()


@cython.final
cdef class Event(_BaseEvent):
    def __repr__(self):
        return f'<{self.__class__.__name__}@{self.type.name}>'

    @staticmethod
    cdef Event create(CEvent c_event):
        cdef Event instance = Event.__new__(Event)
        instance.c_event = c_event
        return instance
    
    @property
    def system(self):
        if self.c_event.system():
            return SystemEvent.create(self.c_event)
    
    @property
    def window(self):
        if self.c_event.window():
            return WindowEvent.create(self.c_event)

    @property
    def keyboard(self):
        if self.c_event.keyboard():
            return KeyboardEvent.create(self.c_event)

    @property
    def mouse(self):
        if self.c_event.mouse():
            return MouseEvent.create(self.c_event)

    @property
    def controller(self):
        if self.c_event.controller():
            return ControllerEvent.create(self.c_event)

    @property
    def audio(self):
        if self.c_event.audio():
            return AudioEvent.create(self.c_event)


cdef class _BaseInputManager:
    cdef CInputManager* c_input_manager

    def __cinit__(self):
        self.c_input_manager = get_c_engine().input_manager.get()


@cython.final
cdef class SystemManager(_BaseInputManager):
    def get_clipboard_text(self):
        self.input_manager.system.get_clipboard_text().c_str()
    
    def set_clipboard_text(self, str text not None):
        self.input_manager.system.set_clipboard_text(text)


@cython.final
cdef class KeyboardManager(_BaseInputManager):
    def is_pressed(self, kc not None):
        return self.c_input_manager.keyboard.is_pressed(
            <CKeycode>(<uint32_t>(kc.value))
        )
    
    def is_released(self, kc not None):
        return self.c_input_manager.keyboard.is_released(
            <CKeycode>(<uint32_t>(kc.value))
        )


@cython.final
cdef class MouseManager(_BaseInputManager):
    def is_pressed(self, mc not None):
        return self.c_input_manager.mouse.is_pressed(
            <CMouseButton>(<uint32_t>(mc.value))
        )
    
    def is_released(self, mc not None):
        return self.c_input_manager.mouse.is_released(
            <CMouseButton>(<uint32_t>(mc.value))
        )
    
    def get_position(self):
        return Vector.from_c_vector(self.c_input_manager.mouse.get_position())


@cython.final
cdef class ControllerManager(_BaseInputManager):
    def is_connected(self, CControllerID controller_id):
        return self.c_input_manager.controller.is_connected(controller_id)
    
    def is_pressed(self, cb not None, CControllerID controller_id):
        return self.c_input_manager.controller.is_pressed(
            <CControllerButton>(<uint32_t>(cb.value)), controller_id
        )
    
    def is_released(self, cb not None, CControllerID controller_id):
        return self.c_input_manager.controller.is_released(
            <CControllerButton>(<uint32_t>(cb.value)), controller_id
        )
    
    def is_axis_pressed(self, axis not None, CControllerID controller_id):
        return self.c_input_manager.controller.is_pressed(
            <CControllerAxis>(<uint32_t>(axis.value)), controller_id
        )

    def is_axis_released(self, axis not None, CControllerID controller_id):
        return self.c_input_manager.controller.is_released(
            <CControllerAxis>(<uint32_t>(axis.value)), controller_id
        )
    
    def get_axis_motion(self, axis not None, CControllerID controller_id):
        return self.c_input_manager.controller.get_axis_motion(
            <CControllerAxis>(<uint32_t>(axis.value)), controller_id
        )
    
    def get_name(self, CControllerID controller_id):
        return self.c_input_manager.controller.get_name(controller_id).c_str()
    
    def get_triggers(self, CControllerID controller_id):
        return Vector.from_c_vector(
            self.c_input_manager.controller.get_triggers(controller_id)
        )
    
    def get_sticks(self, compound_axis not None, CControllerID controller_id):
        return Vector.from_c_vector(
            self.c_input_manager.controller.get_sticks(
                <CCompoundControllerAxis>(<uint32_t>(compound_axis.value)), controller_id
            )
        )

@cython.final
cdef class InputManager(_BaseInputManager):
    cdef:
        readonly SystemManager system
        readonly KeyboardManager keyboard
        readonly MouseManager mouse
        readonly ControllerManager controller

    def __cinit__(self):
        assert self.c_input_manager != NULL

        self.system = SystemManager()
        self.keyboard = KeyboardManager()
        self.mouse = MouseManager()
        self.controller = ControllerManager()
    
    def events(self):
        cdef CEvent c_event
        for c_event in self.c_input_manager.events_queue:
            yield Event.create(c_event)
