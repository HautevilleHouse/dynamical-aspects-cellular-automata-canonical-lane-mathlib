import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsCellularAutomataCanonicalLaneLean.CellularAutomatonSpace

namespace HautevilleHouse
namespace DynamicalAspectsCellularAutomataCanonicalLaneLean

structure ComputationalUniversalityPackage {C : CellularAutomatonSpace} where
  turingComplete : Prop
  universalSimulation : Prop
  intrinsicUniversality : Prop
  turingCompleteTerm : turingComplete
  universalSimulationTerm : universalSimulation
  intrinsicUniversalityTerm : intrinsicUniversality

structure ComputationalUniversalityEvidence {C : CellularAutomatonSpace}
    (U : ComputationalUniversalityPackage C) where
  turingCompleteClosed : U.turingComplete
  universalSimulationClosed : U.universalSimulation
  intrinsicUniversalityClosed : U.intrinsicUniversality

def ComputationalUniversalityClosed {C : CellularAutomatonSpace}
    (U : ComputationalUniversalityPackage C) : Prop :=
  U.turingComplete ∧ U.universalSimulation ∧ U.intrinsicUniversality

theorem computational_universality_closed_from_evidence {C : CellularAutomatonSpace}
    (U : ComputationalUniversalityPackage C) (E : ComputationalUniversalityEvidence U) :
    ComputationalUniversalityClosed U := by
  exact And.intro E.turingCompleteClosed (And.intro E.universalSimulationClosed E.intrinsicUniversalityClosed)

end DynamicalAspectsCellularAutomataCanonicalLaneLean
end HautevilleHouse