import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonSpace

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure AttractorBasinClassificationPackage {C : CellularAutomatonSpace} where
  globalAttractor : Set (C.cellSet → C.stateSet)
  basinOfAttraction : Set (Set (C.cellSet → C.stateSet))
  attractorChainLength : ℕ
  classificationClosure : Prop
  classificationEvidence : classificationClosure

structure AttractorBasinClassificationEvidence {C : CellularAutomatonSpace}
    (A : AttractorBasinClassificationPackage C) where
  attractorChainLengthFinite : A.attractorChainLength < ℕ
  classificationClosed : A.classificationClosure

def AttractorBasinClassificationClosed {C : CellularAutomatonSpace}
    (A : AttractorBasinClassificationPackage C) : Prop :=
  A.classificationClosure

theorem attractor_basin_classification_closed_from_evidence {C : CellularAutomatonSpace}
    (A : AttractorBasinClassificationPackage C) (Ev : AttractorBasinClassificationEvidence A) :
    AttractorBasinClassificationClosed A := by
  exact Ev.classificationClosed

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse