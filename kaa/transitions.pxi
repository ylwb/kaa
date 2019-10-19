from enum import IntEnum

import cython
from libcpp.vector cimport vector

from .kaacore.vectors cimport CVector
from .kaacore.transitions cimport (
    CNodeTransitionHandle, CTransitionWarping,
    CAttributeTransitionMethod, CNodePositionTransition,
    CNodeRotationTransition, CNodeScaleTransition,
    CNodeColorTransition, CBodyNodeVelocityTransition,
    CBodyNodeAngularVelocityTransition, CNodeTransitionDelay,
    make_node_transition, make_node_transitions_sequence,
    make_node_transitions_parallel
)


class AttributeTransitionMethod(IntEnum):
    set = <uint8_t>CAttributeTransitionMethod.set
    add = <uint8_t>CAttributeTransitionMethod.add
    multiply = <uint8_t>CAttributeTransitionMethod.multiply


cdef class NodeTransitionBase:
    cdef CNodeTransitionHandle c_handle

    cdef void _setup_handle(self, const CNodeTransitionHandle& handle):
        self.c_handle = handle

    cdef CTransitionWarping _prepare_warping(self, dict warping_options) except *:
        for k in warping_options:
            assert k in ('loops', 'back_and_forth'), \
                "Unrecognized transition option: {}".format(k)

        return CTransitionWarping(
            warping_options.get('loops', 1),
            warping_options.get('back_and_forth', False),
            # TODO easing
        )


cdef class UnknownTransition(NodeTransitionBase):
    def __init__(self):
        raise NotImplementedError("Initialization of this transition type is forbidden")


@cython.final
cdef class NodePositionTransition(NodeTransitionBase):
    def __init__(self, Vector value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CNodePositionTransition](
                value_advance.c_vector,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class NodeRotationTransition(NodeTransitionBase):
    def __init__(self, double value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CNodeRotationTransition](
                value_advance,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class NodeScaleTransition(NodeTransitionBase):
    def __init__(self, Vector value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CNodeScaleTransition](
                value_advance.c_vector,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class NodeColorTransition(NodeTransitionBase):
    def __init__(self, Color value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CNodeColorTransition](
                value_advance.c_color,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class BodyNodeVelocityTransition(NodeTransitionBase):
    def __init__(self, Vector value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CBodyNodeVelocityTransition](
                value_advance.c_vector,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class BodyNodeAngularVelocityTransition(NodeTransitionBase):
    def __init__(self, double value_advance, double duration, *,
                 advance_method=AttributeTransitionMethod.set,
                 **warping_options,
     ):
        self._setup_handle(
            make_node_transition[CBodyNodeAngularVelocityTransition](
                value_advance,
                (<CAttributeTransitionMethod>(<uint8_t>advance_method.value)),
                duration,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class NodeTransitionDelay(NodeTransitionBase):
    def __init__(self, double duration):
        self._setup_handle(
            make_node_transition[CNodeTransitionDelay](duration)
        )


@cython.final
cdef class NodeTransitionsSequence(NodeTransitionBase):
    def __init__(self, list sub_transitions,
                 **warping_options,
    ):
        cdef vector[CNodeTransitionHandle] c_sub_transitions
        c_sub_transitions.reserve(len(sub_transitions))

        cdef NodeTransitionBase sub_tr
        for sub_tr in sub_transitions:
            c_sub_transitions.push_back(sub_tr.c_handle)

        self._setup_handle(
            make_node_transitions_sequence(
                c_sub_transitions,
                self._prepare_warping(warping_options),
            )
        )


@cython.final
cdef class NodeTransitionsParallel(NodeTransitionBase):
    def __init__(self, list sub_transitions,
                 **warping_options,
    ):
        cdef vector[CNodeTransitionHandle] c_sub_transitions
        c_sub_transitions.reserve(len(sub_transitions))

        cdef NodeTransitionBase sub_tr
        for sub_tr in sub_transitions:
            c_sub_transitions.push_back(sub_tr.c_handle)

        self._setup_handle(
            make_node_transitions_parallel(
                c_sub_transitions,
                self._prepare_warping(warping_options),
            )
        )


cdef NodeTransitionBase get_transition_wrapper(const CNodeTransitionHandle& transition):
    cdef NodeTransitionBase py_transition
    # TODO recongize transition type

    py_transition = UnknownTransition.__new__(UnknownTransition)
    py_transition._setup_handle(transition)

    return py_transition