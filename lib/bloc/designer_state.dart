part of "designer_cubit.dart";

abstract class DesignerState{

}

class DesignerFetched extends DesignerState{
  DataDesigner data;
  DesignerFetched({required this.data});
}

class DesignerLoading extends DesignerState{
  
}