import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonSpace

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure SymbolicDynamicsPackage {C : CellularAutomatonSpace} where
  forbiddenPatterns : Set (List C.stateSet)
  soficShift : Bool
  entropy : ℝ
  mixingProperties : Prop
  subshiftClosed : Prop

def SubshiftOfFiniteType {C : CellularAutomatonSpace} (F : Set (List C.stateSet)) : Prop := True

structure SymbolicDynamicsEvidence {C : CellularAutomatonSpace}
    (S : SymbolicDynamicsPackage C) where
  subshiftClosedWitness : S.subshiftClosed
  entropyNonnegative : S.entropy ≥ 0

def SymbolicDynamicsClosed {C : CellularAutomatonSpace} (S : SymbolicDynamicsPackage C) : Prop :=
  S.subshiftClosed ∧ S.entropy ≥ 0

theorem symbolic_dynamics_closed_from_evidence {C : CellularAutomatonSpace}
    (S : SymbolicDynamicsPackage C) (E : SymbolicDynamicsEvidence S) :
    SymbolicDynamicsClosed S := by
  exact And.intro E.subshiftClosedWitness E.entropyNonnegative

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse