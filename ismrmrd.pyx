cimport cismrmrd
from libc.stdlib cimport calloc, free
from libc.string cimport memcpy
import numpy
cimport numpy
numpy.import_array()

#### Helper functions

cdef AcquisitionHeader_from_struct(cismrmrd.ISMRMRD_AcquisitionHeader *other):
    head = AcquisitionHeader()
    memcpy(head.this, other, sizeof(cismrmrd.ISMRMRD_AcquisitionHeader))
    return head

cdef ImageHeader_from_struct(cismrmrd.ISMRMRD_ImageHeader *other):
    head = ImageHeader()
    memcpy(head.this, other, sizeof(cismrmrd.ISMRMRD_ImageHeader))
    return head

####

cdef class EncodingCounters:
    cdef cismrmrd.ISMRMRD_EncodingCounters *this
    def __cinit__(self):
        self.this = <cismrmrd.ISMRMRD_EncodingCounters*>calloc(1, sizeof(cismrmrd.ISMRMRD_EncodingCounters))
    def __dealloc__(self):
        free(self.this)

    property kspace_encode_step_1:
        def __get__(self): return self.this.kspace_encode_step_1
        def __set__(self, val): self.this.kspace_encode_step_1 = val

    property kspace_encode_step_2:
        def __get__(self): return self.this.kspace_encode_step_2
        def __set__(self, val): self.this.kspace_encode_step_2 = val

    property average:
        def __get__(self): return self.this.average
        def __set__(self, val): self.this.average = val

    property slice:
        def __get__(self): return self.this.slice
        def __set__(self, val): self.this.slice = val

    property contrast:
        def __get__(self): return self.this.contrast
        def __set__(self, val): self.this.contrast = val

    property phase:
        def __get__(self): return self.this.phase
        def __set__(self, val): self.this.phase = val

    property repetition:
        def __get__(self): return self.this.repetition
        def __set__(self, val): self.this.repetition = val

    property set:
        def __get__(self): return self.this.set
        def __set__(self, val): self.this.set = val

    property segment:
        def __get__(self): return self.this.segment
        def __set__(self, val): self.this.segment = val

    property user:
        def __get__(self):
            l = [0 for i in range(cismrmrd.ISMRMRD_USER_INTS)]
            for i in range(cismrmrd.ISMRMRD_USER_INTS):
                l[i] = self.this.user[i]
            return l
        def __set__(self, vals):
            for i in range(cismrmrd.ISMRMRD_USER_INTS):
                self.this.user[i] = vals[i]

cdef class AcquisitionHeader:
    cdef cismrmrd.ISMRMRD_AcquisitionHeader *this
    def __cinit__(self):
        self.this = <cismrmrd.ISMRMRD_AcquisitionHeader*>calloc(1, sizeof(cismrmrd.ISMRMRD_AcquisitionHeader))
    def __dealloc__(self):
        free(self.this)

    property version:
        def __get__(self): return self.this.version
        def __set__(self, val): self.this.version = val

    property flags:
        def __get__(self): return self.this.flags
        def __set__(self, val): self.this.flags = val

    property measurement_uid:
        def __get__(self): return self.this.measurement_uid
        def __set__(self, val): self.this.measurement_uid = val

    property scan_counter:
        def __get__(self): return self.this.scan_counter
        def __set__(self, val): self.this.scan_counter = val

    property acquisition_time_stamp:
        def __get__(self): return self.this.acquisition_time_stamp
        def __set__(self, val): self.this.acquisition_time_stamp = val

    property physiology_time_stamp:
        def __get__(self):
            return [self.this.physiology_time_stamp[i] for i in
                    range(cismrmrd.ISMRMRD_PHYS_STAMPS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_PHYS_STAMPS):
                self.this.physiology_time_stamp[i] = val[i]

    property number_of_samples:
        def __get__(self): return self.this.number_of_samples
        def __set__(self, val): self.this.number_of_samples = val

    property available_channels:
        def __get__(self): return self.this.available_channels
        def __set__(self, val): self.this.available_channels = val

    property active_channels:
        def __get__(self): return self.this.active_channels
        def __set__(self, val): self.this.active_channels = val

    property channel_mask:
        def __get__(self):
            return [self.this.channel_mask[i] for i in
                    range(cismrmrd.ISMRMRD_CHANNEL_MASKS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_CHANNEL_MASKS):
                self.this.channel_mask[i] = val[i]

    property discard_pre:
        def __get__(self): return self.this.discard_pre
        def __set__(self, val): self.this.discard_pre = val

    property discard_post:
        def __get__(self): return self.this.discard_post
        def __set__(self, val): self.this.discard_post = val

    property center_sample:
        def __get__(self): return self.this.center_sample
        def __set__(self, val): self.this.center_sample = val

    property encoding_space_ref:
        def __get__(self): return self.this.encoding_space_ref
        def __set__(self, val): self.this.encoding_space_ref = val

    property trajectory_dimensions:
        def __get__(self): return self.this.trajectory_dimensions
        def __set__(self, val): self.this.trajectory_dimensions = val

    property sample_time_us:
        def __get__(self): return self.this.sample_time_us
        def __set__(self, val): self.this.sample_time_us = val

    property position:
        def __get__(self):
            return [self.this.position[i] for i in
                    range(cismrmrd.ISMRMRD_POSITION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_POSITION_LENGTH):
                self.this.position[i] = val[i]

    property read_dir:
        def __get__(self):
            return [self.this.read_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.read_dir[i] = val[i]

    property phase_dir:
        def __get__(self):
            return [self.this.phase_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.phase_dir[i] = val[i]

    property slice_dir:
        def __get__(self):
            return [self.this.slice_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.slice_dir[i] = val[i]

    property patient_table_position:
        def __get__(self):
            return [self.this.patient_table_position[i] for i in
                    range(cismrmrd.ISMRMRD_POSITION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_POSITION_LENGTH):
                self.this.patient_table_position[i] = val[i]

    property idx:
        def __get__(self): return self.idx
        def __set__(self, val): pass    # FIXME (does nothing)

    property user_int:
        def __get__(self):
            return [self.this.user_int[i] for i in
                    range(cismrmrd.ISMRMRD_USER_INTS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_USER_INTS):
                self.this.user_int[i] = val[i]

    property user_float:
        def __get__(self):
            return [self.this.user_float[i] for i in
                    range(cismrmrd.ISMRMRD_USER_FLOATS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_USER_FLOATS):
                self.this.user_float[i] = val[i]

cdef class Acquisition:
    cdef cismrmrd.ISMRMRD_Acquisition *this
    def __cinit__(self):
        self.this = <cismrmrd.ISMRMRD_Acquisition*>cismrmrd.ismrmrd_create_acquisition()
    def __dealloc__(self):
        cismrmrd.ismrmrd_free_acquisition(self.this)

    property head:
        def __get__(self): return AcquisitionHeader_from_struct(&self.this.head)
        def __set__(self, AcquisitionHeader head):
            memcpy(&self.this.head, head.this,
                    sizeof(cismrmrd.ISMRMRD_AcquisitionHeader))
            cismrmrd.ismrmrd_make_consistent_acquisition(self.this)

    property data:
        def __get__(self):
            cdef numpy.npy_intp shape_data[2]
            shape_data[0] = self.head.active_channels
            shape_data[1] = self.head.number_of_samples
            # careful here, this is a R-W view
            return numpy.PyArray_SimpleNewFromData(2, shape_data,
                    numpy.NPY_COMPLEX64, <void *>(self.this.data))

    property traj:
        def __get__(self):
            cdef numpy.npy_intp shape_traj[2]
            shape_traj[0] = self.head.number_of_samples
            shape_traj[1] = self.head.trajectory_dimensions
            # careful here, this is a R-W view
            # if traj ptr is empty, then will return an empty array
            # which is arguably better than returning a NoneType.
            return numpy.PyArray_SimpleNewFromData(2, shape_traj,
                    numpy.NPY_FLOAT32, <void *>(self.this.traj))

cdef class ImageHeader:
    cdef cismrmrd.ISMRMRD_ImageHeader *this
    def __cinit__(self):
        self.this = <cismrmrd.ISMRMRD_ImageHeader*>calloc(1, sizeof(cismrmrd.ISMRMRD_ImageHeader))
    def __dealloc__(self):
        free(self.this)

    property version:
        def __get__(self): return self.this.version
        def __set__(self, val): self.this.version = val

    property data_type:
        def __get__(self): return self.this.data_type
        def __set__(self, val): self.this.data_type = val

    property flags:
        def __get__(self): return self.this.flags
        def __set__(self, val): self.this.flags = val

    property measurement_uid:
        def __get__(self): return self.this.measurement_uid
        def __set__(self, val): self.this.measurement_uid = val

    property matrix_size:
        def __get__(self):
            return [self.this.matrix_size[i] for i in range(3)]
        def __set__(self, val):
            for i in range(3):
                self.this.matrix_size[i] = val[i]

    property field_of_view:
        def __get__(self):
            return [self.this.field_of_view[i] for i in range(3)]
        def __set__(self, val):
            for i in range(3):
                self.this.field_of_view[i] = val[i]

    property channels:
        def __get__(self): return self.this.channels
        def __set__(self, val): self.this.channels = val

    property position:
        def __get__(self):
            return [self.this.position[i] for i in
                    range(cismrmrd.ISMRMRD_POSITION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_POSITION_LENGTH):
                self.this.position[i] = val[i]

    property read_dir:
        def __get__(self):
            return [self.this.read_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.read_dir[i] = val[i]

    property phase_dir:
        def __get__(self):
            return [self.this.phase_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.phase_dir[i] = val[i]

    property slice_dir:
        def __get__(self):
            return [self.this.slice_dir[i] for i in
                    range(cismrmrd.ISMRMRD_DIRECTION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_DIRECTION_LENGTH):
                self.this.slice_dir[i] = val[i]

    property patient_table_position:
        def __get__(self):
            return [self.this.patient_table_position[i] for i in
                    range(cismrmrd.ISMRMRD_POSITION_LENGTH)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_POSITION_LENGTH):
                self.this.patient_table_position[i] = val[i]

    property average:
        def __get__(self): return self.this.average
        def __set__(self, val): self.this.average = val

    property slice:
        def __get__(self): return self.this.slice
        def __set__(self, val): self.this.slice = val

    property contrast:
        def __get__(self): return self.this.contrast
        def __set__(self, val): self.this.contrast = val

    property phase:
        def __get__(self): return self.this.phase
        def __set__(self, val): self.this.phase = val

    property repetition:
        def __get__(self): return self.this.repetition
        def __set__(self, val): self.this.repetition = val

    property set:
        def __get__(self): return self.this.set
        def __set__(self, val): self.this.set = val

    property acquisition_time_stamp:
        def __get__(self): return self.this.acquisition_time_stamp
        def __set__(self, val): self.this.acquisition_time_stamp = val

    property physiology_time_stamp:
        def __get__(self):
            return [self.this.physiology_time_stamp[i] for i in
                    range(cismrmrd.ISMRMRD_PHYS_STAMPS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_PHYS_STAMPS):
                self.this.physiology_time_stamp[i] = val[i]

    property image_type:
        def __get__(self): return self.this.image_type
        def __set__(self, val): self.this.image_type = val

    property image_index:
        def __get__(self): return self.this.image_index
        def __set__(self, val): self.this.image_index = val

    property image_series_index:
        def __get__(self): return self.this.image_series_index
        def __set__(self, val): self.this.image_series_index = val

    property user_int:
        def __get__(self):
            return [self.this.user_int[i] for i in
                    range(cismrmrd.ISMRMRD_USER_INTS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_USER_INTS):
                self.this.user_int[i] = val[i]

    property user_float:
        def __get__(self):
            return [self.this.user_float[i] for i in
                    range(cismrmrd.ISMRMRD_USER_FLOATS)]
        def __set__(self, val):
            for i in range(cismrmrd.ISMRMRD_USER_FLOATS):
                self.this.user_int[i] = val[i]

cdef class Image:
    cdef cismrmrd.ISMRMRD_Image *this
    def __cinit__(self):
        self.this = <cismrmrd.ISMRMRD_Image*>cismrmrd.ismrmrd_create_image()
    def __dealloc__(self):
        cismrmrd.ismrmrd_free_image(self.this)

    property head:
        def __get__(self): return ImageHeader_from_struct(&self.this.head)
    property attribute_string:
        def __get__(self): return self.this.attribute_string
    property data:
        def __get__(self):
            size = cismrmrd.ismrmrd_size_of_image_data(self.this)
            return None     # FIXME: return NumPy array or Cython Typed MemoryView

cdef class Dataset:
    cdef cismrmrd.ISMRMRD_Dataset *this
    def __cinit__(self, const char *filename, const char *groupname, bint create_if_needed):
        self.this = <cismrmrd.ISMRMRD_Dataset*>calloc(1, sizeof(cismrmrd.ISMRMRD_Dataset))
        cismrmrd.ismrmrd_init_dataset(self.this, filename, groupname)
        cismrmrd.ismrmrd_open_dataset(self.this, create_if_needed)
    def __dealloc__(self):
        cismrmrd.ismrmrd_close_dataset(self.this)
        free(self.this)

    property filename:
        def __get__(self): return self.this.filename
    property groupname:
        def __get__(self): return self.this.filename
    property fileid:
        def __get__(self): return self.this.fileid

    def write_header(self, xmlstring):
        cismrmrd.ismrmrd_write_header(self.this, xmlstring)
    def read_header(self):
        return cismrmrd.ismrmrd_read_header(self.this)
